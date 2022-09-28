#ifndef PIN_HPP
#define PIN_HPP

#include <functional>

#include <drivers/pin.h>

#include <rtthread.h>

namespace rttcxx
{

class Pin
{
public:
    using IrqCallback_t = std::function<void()>;

    enum class Mode : rt_base_t {
        OUTPUT = PIN_MODE_OUTPUT,
        INPUT = PIN_MODE_INPUT,
        INPUT_PULLUP = PIN_MODE_INPUT_PULLUP,
        INPUT_PULLDOWN = PIN_MODE_INPUT_PULLDOWN,
        OUTPUT_OD = PIN_MODE_OUTPUT_OD,
    };

    enum class IRQMode : rt_base_t {
        RISING = PIN_IRQ_MODE_RISING,
        FALLING = PIN_IRQ_MODE_FALLING,
        RISING_FALLING = PIN_IRQ_MODE_RISING_FALLING,
        HIGH_LEVEL = PIN_IRQ_MODE_HIGH_LEVEL,
        LOW_LEVEL = PIN_IRQ_MODE_LOW_LEVEL,
    };

    Pin(rt_base_t p)
        : id { p }
    {
    }

    Pin(const char *name)
        : id { rt_pin_get(name) }
    {
    }

    constexpr auto getId() const { return id; }

    const Pin &setMode(Mode m) const
    {
        rt_pin_mode(id, static_cast<rt_base_t>(m));
        return *this;
    }

    const Pin &write(bool v) const
    {
        rt_pin_write(id, v);
        return *this;
    }

    inline const Pin &high() const { return write(true); }
    inline const Pin &low() const { return write(false); }

    bool read() const
    {
        return static_cast<bool>(rt_pin_read(id));
    }

    operator bool() const { return read(); }

    const Pin &irqEnable() const
    {
        rt_pin_irq_enable(id, PIN_IRQ_ENABLE);
        return *this;
    }

    const Pin &irqDisable() const
    {
        rt_pin_irq_enable(id, PIN_IRQ_DISABLE);
        return *this;
    }

    template <typename F>
    Pin &attach(IRQMode mode, F callback)
    {
        irq = new IrqCallback_t { callback };
        rt_pin_attach_irq(id, static_cast<rt_base_t>(mode), &Pin::trampoline, this);
        return *this;
    }

private:
    rt_base_t id;
    IrqCallback_t *irq = nullptr;

    static void trampoline(void *raw)
    {
        auto self = reinterpret_cast<Pin *>(raw);
        if (self->irq)
            (*(self->irq))();
    }
};

}

#endif // !PIN_HPP
