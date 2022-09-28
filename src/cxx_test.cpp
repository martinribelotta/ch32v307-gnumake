#include <cxx_thread.h>

#include <chrono>

#include "Pin.hpp"
#include "TickClock.hpp"

static void loop(void *)
{
    using namespace rttcxx;
    using namespace std::chrono_literals;

    auto led = Pin { "PC.1" }.setMode(Pin::Mode::OUTPUT);
    auto button = Pin { "PC.0" }.setMode(Pin::Mode::INPUT_PULLUP);
    button.attach(Pin::IRQMode::FALLING, []() {
              rt_kprintf("Button pressed\n");
          })
        .irqEnable();

    auto state = true;
    auto prev = tick_clock::now();
    while (1) {
        auto curr = tick_clock::now();
        if ((curr - prev) >= 100ms) {
            led.write(state = !state);
            prev = curr;
        }
    }
};

static rtthread::Thread th1 {
    loop,                             // entry point
    nullptr,                          // stack area (if null use alloc)
    RT_MAIN_THREAD_STACK_SIZE * 4,    // stack size
    (RT_THREAD_PRIORITY_MAX * 2) / 3, // Priority
    20L,                              // Time slice in same priority
    "cxxth1"                          // thread name
};

static int th1Initializer()
{
    return static_cast<bool>(th1.start());
}

INIT_APP_EXPORT(th1Initializer);
