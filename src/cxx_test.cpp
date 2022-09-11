#include <cxx_thread.h>

class ThreadTest: public  rtthread::Thread
{
public:
    ThreadTest() : Thread(1024, RT_MAIN_THREAD_PRIORITY - 1, 21, "c++th")
    {
    }

    void run()
    {
        while(1) {
            sleep(100);
        }
    }
} threadTest;
