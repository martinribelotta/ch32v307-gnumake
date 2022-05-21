#include <stdio.h>
#include "debug.h"

int main()
{
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
    Delay_Init();
    USART_Printf_Init(115200);
    int cnt = 0;
    for (;;) {
        printf("Hello world %d\n", cnt++);
        Delay_Ms(500);
    }
    return 0;
}
