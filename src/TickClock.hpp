#ifndef TICK_CLOCK_HPP
#define TICK_CLOCK_HPP

#include <chrono>
#include <ratio>

#include <rtthread.h>

namespace rttcxx
{

class tick_clock
{
public:
    typedef clock_t rep;
    typedef std::ratio<1, RT_TICK_PER_SECOND> period;

    typedef std::chrono::duration<tick_clock::rep, tick_clock::period> duration;
    typedef std::chrono::time_point<tick_clock> time_point;

    constexpr static bool is_ready = true;

    static time_point now()
    {
        return tick_clock::time_point(tick_clock::duration { tick_clock::rep { clock() } });
    }
};

}

#endif /* TICK_CLOCK_HPP */
