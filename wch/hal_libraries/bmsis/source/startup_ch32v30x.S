/********************************** (C) COPYRIGHT *******************************
* File Name          : startup_ch32v30x.s
* Author             : WCH
* Version            : V1.0.0
* Date               : 2021/06/06
* Description        : CH32V30x vector table for eclipse toolchain.
*******************************************************************************/

	.section	.init,"ax",@progbits
	.global	_start
	.align	1
_start:
	j	handle_reset
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00100073
    .section    .vector,"ax",@progbits
    .align  1
_vector_base:
    .option norvc;
    .word   _start
    .word   0
    .word   NMI_Handler_Raw                /* NMI */
    .word   HardFault_Handler_Raw          /* Hard Fault */
    .word   0
    .word   Ecall_M_Mode_Handler_Raw       /* Ecall M Mode */
    .word   0
    .word   0
    .word   Ecall_U_Mode_Handler_Raw       /* Ecall U Mode */
    .word   Break_Point_Handler_Raw        /* Break Point */
    .word   0
    .word   0
    .word   SysTick_Handler_Raw            /* SysTick */
    .word   0
    .word   SW_handler_Raw                 /* SW */
    .word   0
    /* External Interrupts */
    .word   WWDG_IRQHandler_Raw            /* Window Watchdog */
    .word   PVD_IRQHandler_Raw             /* PVD through EXTI Line detect */
    .word   TAMPER_IRQHandler_Raw          /* TAMPER */
    .word   RTC_IRQHandler_Raw             /* RTC */
    .word   FLASH_IRQHandler_Raw           /* Flash */
    .word   RCC_IRQHandler_Raw             /* RCC */
    .word   EXTI0_IRQHandler_Raw           /* EXTI Line 0 */
    .word   EXTI1_IRQHandler_Raw           /* EXTI Line 1 */
    .word   EXTI2_IRQHandler_Raw           /* EXTI Line 2 */
    .word   EXTI3_IRQHandler_Raw           /* EXTI Line 3 */
    .word   EXTI4_IRQHandler_Raw           /* EXTI Line 4 */
    .word   DMA1_Channel1_IRQHandler_Raw   /* DMA1 Channel 1 */
    .word   DMA1_Channel2_IRQHandler_Raw   /* DMA1 Channel 2 */
    .word   DMA1_Channel3_IRQHandler_Raw   /* DMA1 Channel 3 */
    .word   DMA1_Channel4_IRQHandler_Raw   /* DMA1 Channel 4 */
    .word   DMA1_Channel5_IRQHandler_Raw   /* DMA1 Channel 5 */
    .word   DMA1_Channel6_IRQHandler_Raw   /* DMA1 Channel 6 */
    .word   DMA1_Channel7_IRQHandler_Raw   /* DMA1 Channel 7 */
    .word   ADC1_2_IRQHandler_Raw          /* ADC1_2 */
    .word   USB_HP_CAN1_TX_IRQHandler_Raw  /* USB HP and CAN1 TX */
    .word   USB_LP_CAN1_RX0_IRQHandler_Raw /* USB LP and CAN1RX0 */
    .word   CAN1_RX1_IRQHandler_Raw        /* CAN1 RX1 */
    .word   CAN1_SCE_IRQHandler_Raw        /* CAN1 SCE */
    .word   EXTI9_5_IRQHandler_Raw         /* EXTI Line 9..5 */
    .word   TIM1_BRK_IRQHandler_Raw        /* TIM1 Break */
    .word   TIM1_UP_IRQHandler_Raw         /* TIM1 Update */
    .word   TIM1_TRG_COM_IRQHandler_Raw    /* TIM1 Trigger and Commutation */
    .word   TIM1_CC_IRQHandler_Raw         /* TIM1 Capture Compare */
    .word   TIM2_IRQHandler_Raw            /* TIM2 */
    .word   TIM3_IRQHandler_Raw            /* TIM3 */
    .word   TIM4_IRQHandler_Raw            /* TIM4 */
    .word   I2C1_EV_IRQHandler_Raw         /* I2C1 Event */
    .word   I2C1_ER_IRQHandler_Raw         /* I2C1 Error */
    .word   I2C2_EV_IRQHandler_Raw         /* I2C2 Event */
    .word   I2C2_ER_IRQHandler_Raw         /* I2C2 Error */
    .word   SPI1_IRQHandler_Raw            /* SPI1 */
    .word   SPI2_IRQHandler_Raw            /* SPI2 */
    .word   USART1_IRQHandler_Raw          /* USART1 */
    .word   USART2_IRQHandler_Raw          /* USART2 */
    .word   USART3_IRQHandler_Raw          /* USART3 */
    .word   EXTI15_10_IRQHandler_Raw       /* EXTI Line 15..10 */
    .word   RTCAlarm_IRQHandler_Raw        /* RTC Alarm through EXTI Line */
    .word   USBWakeUp_IRQHandler_Raw       /* USB Wakeup from suspend */
    .word   TIM8_BRK_IRQHandler_Raw        /* TIM8 Break */
    .word   TIM8_UP_IRQHandler_Raw         /* TIM8 Update */
    .word   TIM8_TRG_COM_IRQHandler_Raw    /* TIM8 Trigger and Commutation */
    .word   TIM8_CC_IRQHandler_Raw         /* TIM8 Capture Compare */
    .word   RNG_IRQHandler_Raw             /* RNG */
    .word   FSMC_IRQHandler_Raw            /* FSMC */
    .word   SDIO_IRQHandler_Raw            /* SDIO */
    .word   TIM5_IRQHandler_Raw            /* TIM5 */
    .word   SPI3_IRQHandler_Raw            /* SPI3 */
    .word   UART4_IRQHandler_Raw           /* UART4 */
    .word   UART5_IRQHandler_Raw           /* UART5 */
    .word   TIM6_IRQHandler_Raw            /* TIM6 */
    .word   TIM7_IRQHandler_Raw            /* TIM7 */
    .word   DMA2_Channel1_IRQHandler_Raw   /* DMA2 Channel 1 */
    .word   DMA2_Channel2_IRQHandler_Raw   /* DMA2 Channel 2 */
    .word   DMA2_Channel3_IRQHandler_Raw   /* DMA2 Channel 3 */
    .word   DMA2_Channel4_IRQHandler_Raw   /* DMA2 Channel 4 */
    .word   DMA2_Channel5_IRQHandler_Raw   /* DMA2 Channel 5 */
    .word   ETH_IRQHandler_Raw             /* ETH */
    .word   ETH_WKUP_IRQHandler_Raw        /* ETH WakeUp */
    .word   CAN2_TX_IRQHandler_Raw         /* CAN2 TX */
    .word   CAN2_RX0_IRQHandler_Raw        /* CAN2 RX0 */
    .word   CAN2_RX1_IRQHandler_Raw        /* CAN2 RX1 */
    .word   CAN2_SCE_IRQHandler_Raw        /* CAN2 SCE */
    .word   OTG_FS_IRQHandler_Raw          /* OTGFS */
    .word   USBHSWakeup_IRQHandler_Raw     /* USBHS Wakeup */
    .word   USBHS_IRQHandler_Raw           /* USBHS */
    .word   DVP_IRQHandler_Raw             /* DVP */
    .word   UART6_IRQHandler_Raw           /* UART6 */
    .word   UART7_IRQHandler_Raw           /* UART7 */
    .word   UART8_IRQHandler_Raw           /* UART8 */
    .word   TIM9_BRK_IRQHandler_Raw        /* TIM9 Break */
    .word   TIM9_UP_IRQHandler_Raw         /* TIM9 Update */
    .word   TIM9_TRG_COM_IRQHandler_Raw    /* TIM9 Trigger and Commutation */
    .word   TIM9_CC_IRQHandler_Raw         /* TIM9 Capture Compare */
    .word   TIM10_BRK_IRQHandler_Raw       /* TIM10 Break */
    .word   TIM10_UP_IRQHandler_Raw        /* TIM10 Update */
    .word   TIM10_TRG_COM_IRQHandler_Raw   /* TIM10 Trigger and Commutation */
    .word   TIM10_CC_IRQHandler_Raw        /* TIM10 Capture Compare */
    .word   DMA2_Channel6_IRQHandler_Raw   /* DMA2 Channel 6 */
    .word   DMA2_Channel7_IRQHandler_Raw   /* DMA2 Channel 7 */
    .word   DMA2_Channel8_IRQHandler_Raw   /* DMA2 Channel 8 */
    .word   DMA2_Channel9_IRQHandler_Raw   /* DMA2 Channel 9 */
    .word   DMA2_Channel10_IRQHandler_Raw  /* DMA2 Channel 10 */
    .word   DMA2_Channel11_IRQHandler_Raw  /* DMA2 Channel 11 */

    .option rvc;

    .section    .text.vector_Handler_Raw, "ax", @progbits
    .weak   NMI_Handler_Raw                /* NMI */
    .weak   HardFault_Handler_Raw          /* Hard Fault */
    .weak   Ecall_M_Mode_Handler_Raw       /* Ecall M Mode */
    .weak   Ecall_U_Mode_Handler_Raw       /* Ecall U Mode */
    .weak   Break_Point_Handler_Raw        /* Break Point */
    .weak   SysTick_Handler_Raw            /* SysTick */
    .weak   SW_handler_Raw                 /* SW */
    .weak   WWDG_IRQHandler_Raw            /* Window Watchdog */
    .weak   PVD_IRQHandler_Raw             /* PVD through EXTI Line detect */
    .weak   TAMPER_IRQHandler_Raw          /* TAMPER */
    .weak   RTC_IRQHandler_Raw             /* RTC */
    .weak   FLASH_IRQHandler_Raw           /* Flash */
    .weak   RCC_IRQHandler_Raw             /* RCC */
    .weak   EXTI0_IRQHandler_Raw           /* EXTI Line 0 */
    .weak   EXTI1_IRQHandler_Raw           /* EXTI Line 1 */
    .weak   EXTI2_IRQHandler_Raw           /* EXTI Line 2 */
    .weak   EXTI3_IRQHandler_Raw           /* EXTI Line 3 */
    .weak   EXTI4_IRQHandler_Raw           /* EXTI Line 4 */
    .weak   DMA1_Channel1_IRQHandler_Raw   /* DMA1 Channel 1 */
    .weak   DMA1_Channel2_IRQHandler_Raw   /* DMA1 Channel 2 */
    .weak   DMA1_Channel3_IRQHandler_Raw   /* DMA1 Channel 3 */
    .weak   DMA1_Channel4_IRQHandler_Raw   /* DMA1 Channel 4 */
    .weak   DMA1_Channel5_IRQHandler_Raw   /* DMA1 Channel 5 */
    .weak   DMA1_Channel6_IRQHandler_Raw   /* DMA1 Channel 6 */
    .weak   DMA1_Channel7_IRQHandler_Raw   /* DMA1 Channel 7 */
    .weak   ADC1_2_IRQHandler_Raw          /* ADC1_2 */
    .weak   USB_HP_CAN1_TX_IRQHandler_Raw  /* USB HP and CAN1 TX */
    .weak   USB_LP_CAN1_RX0_IRQHandler_Raw /* USB LP and CAN1RX0 */
    .weak   CAN1_RX1_IRQHandler_Raw        /* CAN1 RX1 */
    .weak   CAN1_SCE_IRQHandler_Raw        /* CAN1 SCE */
    .weak   EXTI9_5_IRQHandler_Raw         /* EXTI Line 9..5 */
    .weak   TIM1_BRK_IRQHandler_Raw        /* TIM1 Break */
    .weak   TIM1_UP_IRQHandler_Raw         /* TIM1 Update */
    .weak   TIM1_TRG_COM_IRQHandler_Raw    /* TIM1 Trigger and Commutation */
    .weak   TIM1_CC_IRQHandler_Raw         /* TIM1 Capture Compare */
    .weak   TIM2_IRQHandler_Raw            /* TIM2 */
    .weak   TIM3_IRQHandler_Raw            /* TIM3 */
    .weak   TIM4_IRQHandler_Raw            /* TIM4 */
    .weak   I2C1_EV_IRQHandler_Raw         /* I2C1 Event */
    .weak   I2C1_ER_IRQHandler_Raw         /* I2C1 Error */
    .weak   I2C2_EV_IRQHandler_Raw         /* I2C2 Event */
    .weak   I2C2_ER_IRQHandler_Raw         /* I2C2 Error */
    .weak   SPI1_IRQHandler_Raw            /* SPI1 */
    .weak   SPI2_IRQHandler_Raw            /* SPI2 */
    .weak   USART1_IRQHandler_Raw          /* USART1 */
    .weak   USART2_IRQHandler_Raw          /* USART2 */
    .weak   USART3_IRQHandler_Raw          /* USART3 */
    .weak   EXTI15_10_IRQHandler_Raw       /* EXTI Line 15..10 */
    .weak   RTCAlarm_IRQHandler_Raw        /* RTC Alarm through EXTI Line */
    .weak   USBWakeUp_IRQHandler_Raw       /* USB Wakeup from suspend */
    .weak   TIM8_BRK_IRQHandler_Raw        /* TIM8 Break */
    .weak   TIM8_UP_IRQHandler_Raw         /* TIM8 Update */
    .weak   TIM8_TRG_COM_IRQHandler_Raw    /* TIM8 Trigger and Commutation */
    .weak   TIM8_CC_IRQHandler_Raw         /* TIM8 Capture Compare */
    .weak   RNG_IRQHandler_Raw             /* RNG */
    .weak   FSMC_IRQHandler_Raw            /* FSMC */
    .weak   SDIO_IRQHandler_Raw            /* SDIO */
    .weak   TIM5_IRQHandler_Raw            /* TIM5 */
    .weak   SPI3_IRQHandler_Raw            /* SPI3 */
    .weak   UART4_IRQHandler_Raw           /* UART4 */
    .weak   UART5_IRQHandler_Raw           /* UART5 */
    .weak   TIM6_IRQHandler_Raw            /* TIM6 */
    .weak   TIM7_IRQHandler_Raw            /* TIM7 */
    .weak   DMA2_Channel1_IRQHandler_Raw   /* DMA2 Channel 1 */
    .weak   DMA2_Channel2_IRQHandler_Raw   /* DMA2 Channel 2 */
    .weak   DMA2_Channel3_IRQHandler_Raw   /* DMA2 Channel 3 */
    .weak   DMA2_Channel4_IRQHandler_Raw   /* DMA2 Channel 4 */
    .weak   DMA2_Channel5_IRQHandler_Raw   /* DMA2 Channel 5 */
    .weak   ETH_IRQHandler_Raw             /* ETH */
    .weak   ETH_WKUP_IRQHandler_Raw        /* ETH WakeUp */
    .weak   CAN2_TX_IRQHandler_Raw         /* CAN2 TX */
    .weak   CAN2_RX0_IRQHandler_Raw        /* CAN2 RX0 */
    .weak   CAN2_RX1_IRQHandler_Raw        /* CAN2 RX1 */
    .weak   CAN2_SCE_IRQHandler_Raw        /* CAN2 SCE */
    .weak   OTG_FS_IRQHandler_Raw          /* OTGFS */
    .weak   USBHSWakeup_IRQHandler_Raw     /* USBHS Wakeup */
    .weak   USBHS_IRQHandler_Raw           /* USBHS */
    .weak   DVP_IRQHandler_Raw             /* DVP */
    .weak   UART6_IRQHandler_Raw           /* UART6 */
    .weak   UART7_IRQHandler_Raw           /* UART7 */
    .weak   UART8_IRQHandler_Raw           /* UART8 */
    .weak   TIM9_BRK_IRQHandler_Raw        /* TIM9 Break */
    .weak   TIM9_UP_IRQHandler_Raw         /* TIM9 Update */
    .weak   TIM9_TRG_COM_IRQHandler_Raw    /* TIM9 Trigger and Commutation */
    .weak   TIM9_CC_IRQHandler_Raw         /* TIM9 Capture Compare */
    .weak   TIM10_BRK_IRQHandler_Raw       /* TIM10 Break */
    .weak   TIM10_UP_IRQHandler_Raw        /* TIM10 Update */
    .weak   TIM10_TRG_COM_IRQHandler_Raw   /* TIM10 Trigger and Commutation */
    .weak   TIM10_CC_IRQHandler_Raw        /* TIM10 Capture Compare */
    .weak   DMA2_Channel6_IRQHandler_Raw   /* DMA2 Channel 6 */
    .weak   DMA2_Channel7_IRQHandler_Raw   /* DMA2 Channel 7 */
    .weak   DMA2_Channel8_IRQHandler_Raw   /* DMA2 Channel 8 */
    .weak   DMA2_Channel9_IRQHandler_Raw   /* DMA2 Channel 9 */
    .weak   DMA2_Channel10_IRQHandler_Raw  /* DMA2 Channel 10 */
    .weak   DMA2_Channel11_IRQHandler_Raw  /* DMA2 Channel 11 */

NMI_Handler_Raw:    call NMI_Handler; mret
HardFault_Handler_Raw:  call HardFault_Handler; mret
Ecall_M_Mode_Handler_Raw:   call Ecall_M_Mode_Handler; mret
Ecall_U_Mode_Handler_Raw:   call Ecall_U_Mode_Handler; mret
Break_Point_Handler_Raw:    call Break_Point_Handler; mret
SysTick_Handler_Raw:    call SysTick_Handler; mret
SW_handler_Raw: call SW_handler; mret
WWDG_IRQHandler_Raw:    call WWDG_IRQHandler; mret
PVD_IRQHandler_Raw: call PVD_IRQHandler; mret
TAMPER_IRQHandler_Raw:  call TAMPER_IRQHandler; mret
RTC_IRQHandler_Raw: call RTC_IRQHandler; mret
FLASH_IRQHandler_Raw:   call FLASH_IRQHandler; mret
RCC_IRQHandler_Raw: call RCC_IRQHandler; mret
EXTI0_IRQHandler_Raw:   call EXTI0_IRQHandler; mret
EXTI1_IRQHandler_Raw:   call EXTI1_IRQHandler; mret
EXTI2_IRQHandler_Raw:   call EXTI2_IRQHandler; mret
EXTI3_IRQHandler_Raw:   call EXTI3_IRQHandler; mret
EXTI4_IRQHandler_Raw:   call EXTI4_IRQHandler; mret
DMA1_Channel1_IRQHandler_Raw:   call DMA1_Channel1_IRQHandler; mret
DMA1_Channel2_IRQHandler_Raw:   call DMA1_Channel2_IRQHandler; mret
DMA1_Channel3_IRQHandler_Raw:   call DMA1_Channel3_IRQHandler; mret
DMA1_Channel4_IRQHandler_Raw:   call DMA1_Channel4_IRQHandler; mret
DMA1_Channel5_IRQHandler_Raw:   call DMA1_Channel5_IRQHandler; mret
DMA1_Channel6_IRQHandler_Raw:   call DMA1_Channel6_IRQHandler; mret
DMA1_Channel7_IRQHandler_Raw:   call DMA1_Channel7_IRQHandler; mret
ADC1_2_IRQHandler_Raw:  call ADC1_2_IRQHandler; mret
USB_HP_CAN1_TX_IRQHandler_Raw:  call USB_HP_CAN1_TX_IRQHandler; mret
USB_LP_CAN1_RX0_IRQHandler_Raw: call USB_LP_CAN1_RX0_IRQHandler; mret
CAN1_RX1_IRQHandler_Raw:    call CAN1_RX1_IRQHandler; mret
CAN1_SCE_IRQHandler_Raw:    call CAN1_SCE_IRQHandler; mret
EXTI9_5_IRQHandler_Raw: call EXTI9_5_IRQHandler; mret
TIM1_BRK_IRQHandler_Raw:    call TIM1_BRK_IRQHandler; mret
TIM1_UP_IRQHandler_Raw: call TIM1_UP_IRQHandler; mret
TIM1_TRG_COM_IRQHandler_Raw:    call TIM1_TRG_COM_IRQHandler; mret
TIM1_CC_IRQHandler_Raw: call TIM1_CC_IRQHandler; mret
TIM2_IRQHandler_Raw:    call TIM2_IRQHandler; mret
TIM3_IRQHandler_Raw:    call TIM3_IRQHandler; mret
TIM4_IRQHandler_Raw:    call TIM4_IRQHandler; mret
I2C1_EV_IRQHandler_Raw: call I2C1_EV_IRQHandler; mret
I2C1_ER_IRQHandler_Raw: call I2C1_ER_IRQHandler; mret
I2C2_EV_IRQHandler_Raw: call I2C2_EV_IRQHandler; mret
I2C2_ER_IRQHandler_Raw: call I2C2_ER_IRQHandler; mret
SPI1_IRQHandler_Raw:    call SPI1_IRQHandler; mret
SPI2_IRQHandler_Raw:    call SPI2_IRQHandler; mret
USART1_IRQHandler_Raw:  call USART1_IRQHandler; mret
USART2_IRQHandler_Raw:  call USART2_IRQHandler; mret
USART3_IRQHandler_Raw:  call USART3_IRQHandler; mret
EXTI15_10_IRQHandler_Raw:   call EXTI15_10_IRQHandler; mret
RTCAlarm_IRQHandler_Raw:    call RTCAlarm_IRQHandler; mret
USBWakeUp_IRQHandler_Raw:   call USBWakeUp_IRQHandler; mret
TIM8_BRK_IRQHandler_Raw:    call TIM8_BRK_IRQHandler; mret
TIM8_UP_IRQHandler_Raw: call TIM8_UP_IRQHandler; mret
TIM8_TRG_COM_IRQHandler_Raw:    call TIM8_TRG_COM_IRQHandler; mret
TIM8_CC_IRQHandler_Raw: call TIM8_CC_IRQHandler; mret
RNG_IRQHandler_Raw: call RNG_IRQHandler; mret
FSMC_IRQHandler_Raw:    call FSMC_IRQHandler; mret
SDIO_IRQHandler_Raw:    call SDIO_IRQHandler; mret
TIM5_IRQHandler_Raw:    call TIM5_IRQHandler; mret
SPI3_IRQHandler_Raw:    call SPI3_IRQHandler; mret
UART4_IRQHandler_Raw:   call UART4_IRQHandler; mret
UART5_IRQHandler_Raw:   call UART5_IRQHandler; mret
TIM6_IRQHandler_Raw:    call TIM6_IRQHandler; mret
TIM7_IRQHandler_Raw:    call TIM7_IRQHandler; mret
DMA2_Channel1_IRQHandler_Raw:   call DMA2_Channel1_IRQHandler; mret
DMA2_Channel2_IRQHandler_Raw:   call DMA2_Channel2_IRQHandler; mret
DMA2_Channel3_IRQHandler_Raw:   call DMA2_Channel3_IRQHandler; mret
DMA2_Channel4_IRQHandler_Raw:   call DMA2_Channel4_IRQHandler; mret
DMA2_Channel5_IRQHandler_Raw:   call DMA2_Channel5_IRQHandler; mret
ETH_IRQHandler_Raw: call ETH_IRQHandler; mret
ETH_WKUP_IRQHandler_Raw:    call ETH_WKUP_IRQHandler; mret
CAN2_TX_IRQHandler_Raw: call CAN2_TX_IRQHandler; mret
CAN2_RX0_IRQHandler_Raw:    call CAN2_RX0_IRQHandler; mret
CAN2_RX1_IRQHandler_Raw:    call CAN2_RX1_IRQHandler; mret
CAN2_SCE_IRQHandler_Raw:    call CAN2_SCE_IRQHandler; mret
OTG_FS_IRQHandler_Raw:  call OTG_FS_IRQHandler; mret
USBHSWakeup_IRQHandler_Raw: call USBHSWakeup_IRQHandler; mret
USBHS_IRQHandler_Raw:   call USBHS_IRQHandler; mret
DVP_IRQHandler_Raw: call DVP_IRQHandler; mret
UART6_IRQHandler_Raw:   call UART6_IRQHandler; mret
UART7_IRQHandler_Raw:   call UART7_IRQHandler; mret
UART8_IRQHandler_Raw:   call UART8_IRQHandler; mret
TIM9_BRK_IRQHandler_Raw:    call TIM9_BRK_IRQHandler; mret
TIM9_UP_IRQHandler_Raw: call TIM9_UP_IRQHandler; mret
TIM9_TRG_COM_IRQHandler_Raw:    call TIM9_TRG_COM_IRQHandler; mret
TIM9_CC_IRQHandler_Raw: call TIM9_CC_IRQHandler; mret
TIM10_BRK_IRQHandler_Raw:   call TIM10_BRK_IRQHandler; mret
TIM10_UP_IRQHandler_Raw:    call TIM10_UP_IRQHandler; mret
TIM10_TRG_COM_IRQHandler_Raw:   call TIM10_TRG_COM_IRQHandler; mret
TIM10_CC_IRQHandler_Raw:    call TIM10_CC_IRQHandler; mret
DMA2_Channel6_IRQHandler_Raw:   call DMA2_Channel6_IRQHandler; mret
DMA2_Channel7_IRQHandler_Raw:   call DMA2_Channel7_IRQHandler; mret
DMA2_Channel8_IRQHandler_Raw:   call DMA2_Channel8_IRQHandler; mret
DMA2_Channel9_IRQHandler_Raw:   call DMA2_Channel9_IRQHandler; mret
DMA2_Channel10_IRQHandler_Raw:  call DMA2_Channel10_IRQHandler; mret
DMA2_Channel11_IRQHandler_Raw:  call DMA2_Channel11_IRQHandler; mret


	.section	.text.handle_reset,"ax",@progbits
	.weak	handle_reset
	.align	1
handle_reset:
.option push 
.option	norelax 
    csrw mepc, t0
	la gp, __global_pointer$
.option	pop 
1:
	la sp, _eusrstack 
2:
	/* Load data section from flash to RAM */
	la a0, _data_lma
	la a1, _data_vma
	la a2, _edata
	bgeu a1, a2, 2f
1:
	lw t0, (a0)
	sw t0, (a1)
	addi a0, a0, 4
	addi a1, a1, 4
	bltu a1, a2, 1b
2:
	/* Clear bss section */
	la a0, _sbss
	la a1, _ebss
	bgeu a0, a1, 2f
1:
	sw zero, (a0)
	addi a0, a0, 4
	bltu a0, a1, 1b
2:
    li t0, 0x1f
    csrw 0xbc0, t0

    /* Enable hardware stack */
    li t0,0x1
	csrw 0x804, t0


    /* Enable floating point and interrupt */
   	li t0, 0x7800
   	csrs mstatus, t0

 	la t0, _vector_base
    ori t0, t0, 3           
	csrw mtvec, t0

    jal  SystemInit
	la t0, entry
	csrw mepc, t0
	mret


