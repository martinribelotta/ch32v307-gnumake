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
    .word   NMI_Handler_Base                /* NMI */
    .word   HardFault_Handler_Base          /* Hard Fault */
    .word   0
    .word   Ecall_M_Mode_Handler_Base       /* Ecall M Mode */
    .word   0
    .word   0
    .word   Ecall_U_Mode_Handler_Base       /* Ecall U Mode */
    .word   Break_Point_Handler_Base        /* Break Point */
    .word   0
    .word   0
    .word   SysTick_Handler_Base            /* SysTick */
    .word   0
    .word   SW_handler_Base                 /* SW */
    .word   0
    /* External Interrupts */
    .word   WWDG_IRQHandler_Base            /* Window Watchdog */
    .word   PVD_IRQHandler_Base             /* PVD through EXTI Line detect */
    .word   TAMPER_IRQHandler_Base          /* TAMPER */
    .word   RTC_IRQHandler_Base             /* RTC */
    .word   FLASH_IRQHandler_Base           /* Flash */
    .word   RCC_IRQHandler_Base             /* RCC */
    .word   EXTI0_IRQHandler_Base           /* EXTI Line 0 */
    .word   EXTI1_IRQHandler_Base           /* EXTI Line 1 */
    .word   EXTI2_IRQHandler_Base           /* EXTI Line 2 */
    .word   EXTI3_IRQHandler_Base           /* EXTI Line 3 */
    .word   EXTI4_IRQHandler_Base           /* EXTI Line 4 */
    .word   DMA1_Channel1_IRQHandler_Base   /* DMA1 Channel 1 */
    .word   DMA1_Channel2_IRQHandler_Base   /* DMA1 Channel 2 */
    .word   DMA1_Channel3_IRQHandler_Base   /* DMA1 Channel 3 */
    .word   DMA1_Channel4_IRQHandler_Base   /* DMA1 Channel 4 */
    .word   DMA1_Channel5_IRQHandler_Base   /* DMA1 Channel 5 */
    .word   DMA1_Channel6_IRQHandler_Base   /* DMA1 Channel 6 */
    .word   DMA1_Channel7_IRQHandler_Base   /* DMA1 Channel 7 */
    .word   ADC1_2_IRQHandler_Base          /* ADC1_2 */
    .word   USB_HP_CAN1_TX_IRQHandler_Base  /* USB HP and CAN1 TX */
    .word   USB_LP_CAN1_RX0_IRQHandler_Base /* USB LP and CAN1RX0 */
    .word   CAN1_RX1_IRQHandler_Base        /* CAN1 RX1 */
    .word   CAN1_SCE_IRQHandler_Base        /* CAN1 SCE */
    .word   EXTI9_5_IRQHandler_Base         /* EXTI Line 9..5 */
    .word   TIM1_BRK_IRQHandler_Base        /* TIM1 Break */
    .word   TIM1_UP_IRQHandler_Base         /* TIM1 Update */
    .word   TIM1_TRG_COM_IRQHandler_Base    /* TIM1 Trigger and Commutation */
    .word   TIM1_CC_IRQHandler_Base         /* TIM1 Capture Compare */
    .word   TIM2_IRQHandler_Base            /* TIM2 */
    .word   TIM3_IRQHandler_Base            /* TIM3 */
    .word   TIM4_IRQHandler_Base            /* TIM4 */
    .word   I2C1_EV_IRQHandler_Base         /* I2C1 Event */
    .word   I2C1_ER_IRQHandler_Base         /* I2C1 Error */
    .word   I2C2_EV_IRQHandler_Base         /* I2C2 Event */
    .word   I2C2_ER_IRQHandler_Base         /* I2C2 Error */
    .word   SPI1_IRQHandler_Base            /* SPI1 */
    .word   SPI2_IRQHandler_Base            /* SPI2 */
    .word   USART1_IRQHandler_Base          /* USART1 */
    .word   USART2_IRQHandler_Base          /* USART2 */
    .word   USART3_IRQHandler_Base          /* USART3 */
    .word   EXTI15_10_IRQHandler_Base       /* EXTI Line 15..10 */
    .word   RTCAlarm_IRQHandler_Base        /* RTC Alarm through EXTI Line */
    .word   USBWakeUp_IRQHandler_Base       /* USB Wakeup from suspend */
    .word   TIM8_BRK_IRQHandler_Base        /* TIM8 Break */
    .word   TIM8_UP_IRQHandler_Base         /* TIM8 Update */
    .word   TIM8_TRG_COM_IRQHandler_Base    /* TIM8 Trigger and Commutation */
    .word   TIM8_CC_IRQHandler_Base         /* TIM8 Capture Compare */
    .word   RNG_IRQHandler_Base             /* RNG */
    .word   FSMC_IRQHandler_Base            /* FSMC */
    .word   SDIO_IRQHandler_Base            /* SDIO */
    .word   TIM5_IRQHandler_Base            /* TIM5 */
    .word   SPI3_IRQHandler_Base            /* SPI3 */
    .word   UART4_IRQHandler_Base           /* UART4 */
    .word   UART5_IRQHandler_Base           /* UART5 */
    .word   TIM6_IRQHandler_Base            /* TIM6 */
    .word   TIM7_IRQHandler_Base            /* TIM7 */
    .word   DMA2_Channel1_IRQHandler_Base   /* DMA2 Channel 1 */
    .word   DMA2_Channel2_IRQHandler_Base   /* DMA2 Channel 2 */
    .word   DMA2_Channel3_IRQHandler_Base   /* DMA2 Channel 3 */
    .word   DMA2_Channel4_IRQHandler_Base   /* DMA2 Channel 4 */
    .word   DMA2_Channel5_IRQHandler_Base   /* DMA2 Channel 5 */
    .word   ETH_IRQHandler_Base             /* ETH */
    .word   ETH_WKUP_IRQHandler_Base        /* ETH WakeUp */
    .word   CAN2_TX_IRQHandler_Base         /* CAN2 TX */
    .word   CAN2_RX0_IRQHandler_Base        /* CAN2 RX0 */
    .word   CAN2_RX1_IRQHandler_Base        /* CAN2 RX1 */
    .word   CAN2_SCE_IRQHandler_Base        /* CAN2 SCE */
    .word   OTG_FS_IRQHandler_Base          /* OTGFS */
    .word   USBHSWakeup_IRQHandler_Base     /* USBHS Wakeup */
    .word   USBHS_IRQHandler_Base           /* USBHS */
    .word   DVP_IRQHandler_Base             /* DVP */
    .word   UART6_IRQHandler_Base           /* UART6 */
    .word   UART7_IRQHandler_Base           /* UART7 */
    .word   UART8_IRQHandler_Base           /* UART8 */
    .word   TIM9_BRK_IRQHandler_Base        /* TIM9 Break */
    .word   TIM9_UP_IRQHandler_Base         /* TIM9 Update */
    .word   TIM9_TRG_COM_IRQHandler_Base    /* TIM9 Trigger and Commutation */
    .word   TIM9_CC_IRQHandler_Base         /* TIM9 Capture Compare */
    .word   TIM10_BRK_IRQHandler_Base       /* TIM10 Break */
    .word   TIM10_UP_IRQHandler_Base        /* TIM10 Update */
    .word   TIM10_TRG_COM_IRQHandler_Base   /* TIM10 Trigger and Commutation */
    .word   TIM10_CC_IRQHandler_Base        /* TIM10 Capture Compare */
    .word   DMA2_Channel6_IRQHandler_Base   /* DMA2 Channel 6 */
    .word   DMA2_Channel7_IRQHandler_Base   /* DMA2 Channel 7 */
    .word   DMA2_Channel8_IRQHandler_Base   /* DMA2 Channel 8 */
    .word   DMA2_Channel9_IRQHandler_Base   /* DMA2 Channel 9 */
    .word   DMA2_Channel10_IRQHandler_Base  /* DMA2 Channel 10 */
    .word   DMA2_Channel11_IRQHandler_Base  /* DMA2 Channel 11 */

    .option rvc;

    .section    .text.vector_Handler_Base, "ax", @progbits
    .weak   NMI_Handler_Base                /* NMI */
    .weak   HardFault_Handler_Base          /* Hard Fault */
    .weak   Ecall_M_Mode_Handler_Base       /* Ecall M Mode */
    .weak   Ecall_U_Mode_Handler_Base       /* Ecall U Mode */
    .weak   Break_Point_Handler_Base        /* Break Point */
    .weak   SysTick_Handler_Base            /* SysTick */
    .weak   SW_handler_Base                 /* SW */
    .weak   WWDG_IRQHandler_Base            /* Window Watchdog */
    .weak   PVD_IRQHandler_Base             /* PVD through EXTI Line detect */
    .weak   TAMPER_IRQHandler_Base          /* TAMPER */
    .weak   RTC_IRQHandler_Base             /* RTC */
    .weak   FLASH_IRQHandler_Base           /* Flash */
    .weak   RCC_IRQHandler_Base             /* RCC */
    .weak   EXTI0_IRQHandler_Base           /* EXTI Line 0 */
    .weak   EXTI1_IRQHandler_Base           /* EXTI Line 1 */
    .weak   EXTI2_IRQHandler_Base           /* EXTI Line 2 */
    .weak   EXTI3_IRQHandler_Base           /* EXTI Line 3 */
    .weak   EXTI4_IRQHandler_Base           /* EXTI Line 4 */
    .weak   DMA1_Channel1_IRQHandler_Base   /* DMA1 Channel 1 */
    .weak   DMA1_Channel2_IRQHandler_Base   /* DMA1 Channel 2 */
    .weak   DMA1_Channel3_IRQHandler_Base   /* DMA1 Channel 3 */
    .weak   DMA1_Channel4_IRQHandler_Base   /* DMA1 Channel 4 */
    .weak   DMA1_Channel5_IRQHandler_Base   /* DMA1 Channel 5 */
    .weak   DMA1_Channel6_IRQHandler_Base   /* DMA1 Channel 6 */
    .weak   DMA1_Channel7_IRQHandler_Base   /* DMA1 Channel 7 */
    .weak   ADC1_2_IRQHandler_Base          /* ADC1_2 */
    .weak   USB_HP_CAN1_TX_IRQHandler_Base  /* USB HP and CAN1 TX */
    .weak   USB_LP_CAN1_RX0_IRQHandler_Base /* USB LP and CAN1RX0 */
    .weak   CAN1_RX1_IRQHandler_Base        /* CAN1 RX1 */
    .weak   CAN1_SCE_IRQHandler_Base        /* CAN1 SCE */
    .weak   EXTI9_5_IRQHandler_Base         /* EXTI Line 9..5 */
    .weak   TIM1_BRK_IRQHandler_Base        /* TIM1 Break */
    .weak   TIM1_UP_IRQHandler_Base         /* TIM1 Update */
    .weak   TIM1_TRG_COM_IRQHandler_Base    /* TIM1 Trigger and Commutation */
    .weak   TIM1_CC_IRQHandler_Base         /* TIM1 Capture Compare */
    .weak   TIM2_IRQHandler_Base            /* TIM2 */
    .weak   TIM3_IRQHandler_Base            /* TIM3 */
    .weak   TIM4_IRQHandler_Base            /* TIM4 */
    .weak   I2C1_EV_IRQHandler_Base         /* I2C1 Event */
    .weak   I2C1_ER_IRQHandler_Base         /* I2C1 Error */
    .weak   I2C2_EV_IRQHandler_Base         /* I2C2 Event */
    .weak   I2C2_ER_IRQHandler_Base         /* I2C2 Error */
    .weak   SPI1_IRQHandler_Base            /* SPI1 */
    .weak   SPI2_IRQHandler_Base            /* SPI2 */
    .weak   USART1_IRQHandler_Base          /* USART1 */
    .weak   USART2_IRQHandler_Base          /* USART2 */
    .weak   USART3_IRQHandler_Base          /* USART3 */
    .weak   EXTI15_10_IRQHandler_Base       /* EXTI Line 15..10 */
    .weak   RTCAlarm_IRQHandler_Base        /* RTC Alarm through EXTI Line */
    .weak   USBWakeUp_IRQHandler_Base       /* USB Wakeup from suspend */
    .weak   TIM8_BRK_IRQHandler_Base        /* TIM8 Break */
    .weak   TIM8_UP_IRQHandler_Base         /* TIM8 Update */
    .weak   TIM8_TRG_COM_IRQHandler_Base    /* TIM8 Trigger and Commutation */
    .weak   TIM8_CC_IRQHandler_Base         /* TIM8 Capture Compare */
    .weak   RNG_IRQHandler_Base             /* RNG */
    .weak   FSMC_IRQHandler_Base            /* FSMC */
    .weak   SDIO_IRQHandler_Base            /* SDIO */
    .weak   TIM5_IRQHandler_Base            /* TIM5 */
    .weak   SPI3_IRQHandler_Base            /* SPI3 */
    .weak   UART4_IRQHandler_Base           /* UART4 */
    .weak   UART5_IRQHandler_Base           /* UART5 */
    .weak   TIM6_IRQHandler_Base            /* TIM6 */
    .weak   TIM7_IRQHandler_Base            /* TIM7 */
    .weak   DMA2_Channel1_IRQHandler_Base   /* DMA2 Channel 1 */
    .weak   DMA2_Channel2_IRQHandler_Base   /* DMA2 Channel 2 */
    .weak   DMA2_Channel3_IRQHandler_Base   /* DMA2 Channel 3 */
    .weak   DMA2_Channel4_IRQHandler_Base   /* DMA2 Channel 4 */
    .weak   DMA2_Channel5_IRQHandler_Base   /* DMA2 Channel 5 */
    .weak   ETH_IRQHandler_Base             /* ETH */
    .weak   ETH_WKUP_IRQHandler_Base        /* ETH WakeUp */
    .weak   CAN2_TX_IRQHandler_Base         /* CAN2 TX */
    .weak   CAN2_RX0_IRQHandler_Base        /* CAN2 RX0 */
    .weak   CAN2_RX1_IRQHandler_Base        /* CAN2 RX1 */
    .weak   CAN2_SCE_IRQHandler_Base        /* CAN2 SCE */
    .weak   OTG_FS_IRQHandler_Base          /* OTGFS */
    .weak   USBHSWakeup_IRQHandler_Base     /* USBHS Wakeup */
    .weak   USBHS_IRQHandler_Base           /* USBHS */
    .weak   DVP_IRQHandler_Base             /* DVP */
    .weak   UART6_IRQHandler_Base           /* UART6 */
    .weak   UART7_IRQHandler_Base           /* UART7 */
    .weak   UART8_IRQHandler_Base           /* UART8 */
    .weak   TIM9_BRK_IRQHandler_Base        /* TIM9 Break */
    .weak   TIM9_UP_IRQHandler_Base         /* TIM9 Update */
    .weak   TIM9_TRG_COM_IRQHandler_Base    /* TIM9 Trigger and Commutation */
    .weak   TIM9_CC_IRQHandler_Base         /* TIM9 Capture Compare */
    .weak   TIM10_BRK_IRQHandler_Base       /* TIM10 Break */
    .weak   TIM10_UP_IRQHandler_Base        /* TIM10 Update */
    .weak   TIM10_TRG_COM_IRQHandler_Base   /* TIM10 Trigger and Commutation */
    .weak   TIM10_CC_IRQHandler_Base        /* TIM10 Capture Compare */
    .weak   DMA2_Channel6_IRQHandler_Base   /* DMA2 Channel 6 */
    .weak   DMA2_Channel7_IRQHandler_Base   /* DMA2 Channel 7 */
    .weak   DMA2_Channel8_IRQHandler_Base   /* DMA2 Channel 8 */
    .weak   DMA2_Channel9_IRQHandler_Base   /* DMA2 Channel 9 */
    .weak   DMA2_Channel10_IRQHandler_Base  /* DMA2 Channel 10 */
    .weak   DMA2_Channel11_IRQHandler_Base  /* DMA2 Channel 11 */

NMI_Handler_Base:
    call NMI_Handler
    mret

HardFault_Handler_Base:
    call HardFault_Handler
    mret

Ecall_M_Mode_Handler_Base:
    call Ecall_M_Mode_Handler
    mret

Ecall_U_Mode_Handler_Base:
    call Ecall_U_Mode_Handler
    mret

Break_Point_Handler_Base:
    call Break_Point_Handler
    mret

SysTick_Handler_Base:
    call SysTick_Handler
    mret

SW_handler_Base:
    call SW_handler
    mret

WWDG_IRQHandler_Base:
    call WWDG_IRQHandler
    mret

PVD_IRQHandler_Base:
    call PVD_IRQHandler
    mret

TAMPER_IRQHandler_Base:
    call TAMPER_IRQHandler
    mret

RTC_IRQHandler_Base:
    call RTC_IRQHandler
    mret

FLASH_IRQHandler_Base:
    call FLASH_IRQHandler
    mret

RCC_IRQHandler_Base:
    call RCC_IRQHandler
    mret

EXTI0_IRQHandler_Base:
    call EXTI0_IRQHandler
    mret

EXTI1_IRQHandler_Base:
    call EXTI1_IRQHandler
    mret

EXTI2_IRQHandler_Base:
    call EXTI2_IRQHandler
    mret

EXTI3_IRQHandler_Base:
    call EXTI3_IRQHandler
    mret

EXTI4_IRQHandler_Base:
    call EXTI4_IRQHandler
    mret

DMA1_Channel1_IRQHandler_Base:
    call DMA1_Channel1_IRQHandler
    mret

DMA1_Channel2_IRQHandler_Base:
    call DMA1_Channel2_IRQHandler
    mret

DMA1_Channel3_IRQHandler_Base:
    call DMA1_Channel3_IRQHandler
    mret

DMA1_Channel4_IRQHandler_Base:
    call DMA1_Channel4_IRQHandler
    mret

DMA1_Channel5_IRQHandler_Base:
    call DMA1_Channel5_IRQHandler
    mret

DMA1_Channel6_IRQHandler_Base:
    call DMA1_Channel6_IRQHandler
    mret

DMA1_Channel7_IRQHandler_Base:
    call DMA1_Channel7_IRQHandler
    mret

ADC1_2_IRQHandler_Base:
    call ADC1_2_IRQHandler
    mret

USB_HP_CAN1_TX_IRQHandler_Base:
    call USB_HP_CAN1_TX_IRQHandler
    mret

USB_LP_CAN1_RX0_IRQHandler_Base:
    call USB_LP_CAN1_RX0_IRQHandler
    mret

CAN1_RX1_IRQHandler_Base:
    call CAN1_RX1_IRQHandler
    mret

CAN1_SCE_IRQHandler_Base:
    call CAN1_SCE_IRQHandler
    mret

EXTI9_5_IRQHandler_Base:
    call EXTI9_5_IRQHandler
    mret

TIM1_BRK_IRQHandler_Base:
    call TIM1_BRK_IRQHandler
    mret

TIM1_UP_IRQHandler_Base:
    call TIM1_UP_IRQHandler
    mret

TIM1_TRG_COM_IRQHandler_Base:
    call TIM1_TRG_COM_IRQHandler
    mret

TIM1_CC_IRQHandler_Base:
    call TIM1_CC_IRQHandler
    mret

TIM2_IRQHandler_Base:
    call TIM2_IRQHandler
    mret

TIM3_IRQHandler_Base:
    call TIM3_IRQHandler
    mret

TIM4_IRQHandler_Base:
    call TIM4_IRQHandler
    mret

I2C1_EV_IRQHandler_Base:
    call I2C1_EV_IRQHandler
    mret

I2C1_ER_IRQHandler_Base:
    call I2C1_ER_IRQHandler
    mret

I2C2_EV_IRQHandler_Base:
    call I2C2_EV_IRQHandler
    mret

I2C2_ER_IRQHandler_Base:
    call I2C2_ER_IRQHandler
    mret

SPI1_IRQHandler_Base:
    call SPI1_IRQHandler
    mret

SPI2_IRQHandler_Base:
    call SPI2_IRQHandler
    mret

USART1_IRQHandler_Base:
    call USART1_IRQHandler
    mret

USART2_IRQHandler_Base:
    call USART2_IRQHandler
    mret

USART3_IRQHandler_Base:
    call USART3_IRQHandler
    mret

EXTI15_10_IRQHandler_Base:
    call EXTI15_10_IRQHandler
    mret

RTCAlarm_IRQHandler_Base:
    call RTCAlarm_IRQHandler
    mret

USBWakeUp_IRQHandler_Base:
    call USBWakeUp_IRQHandler
    mret

TIM8_BRK_IRQHandler_Base:
    call TIM8_BRK_IRQHandler
    mret

TIM8_UP_IRQHandler_Base:
    call TIM8_UP_IRQHandler
    mret

TIM8_TRG_COM_IRQHandler_Base:
    call TIM8_TRG_COM_IRQHandler
    mret

TIM8_CC_IRQHandler_Base:
    call TIM8_CC_IRQHandler
    mret

RNG_IRQHandler_Base:
    call RNG_IRQHandler
    mret

FSMC_IRQHandler_Base:
    call FSMC_IRQHandler
    mret

SDIO_IRQHandler_Base:
    call SDIO_IRQHandler
    mret

TIM5_IRQHandler_Base:
    call TIM5_IRQHandler
    mret

SPI3_IRQHandler_Base:
    call SPI3_IRQHandler
    mret

UART4_IRQHandler_Base:
    call UART4_IRQHandler
    mret

UART5_IRQHandler_Base:
    call UART5_IRQHandler
    mret

TIM6_IRQHandler_Base:
    call TIM6_IRQHandler
    mret

TIM7_IRQHandler_Base:
    call TIM7_IRQHandler
    mret

DMA2_Channel1_IRQHandler_Base:
    call DMA2_Channel1_IRQHandler
    mret

DMA2_Channel2_IRQHandler_Base:
    call DMA2_Channel2_IRQHandler
    mret

DMA2_Channel3_IRQHandler_Base:
    call DMA2_Channel3_IRQHandler
    mret

DMA2_Channel4_IRQHandler_Base:
    call DMA2_Channel4_IRQHandler
    mret

DMA2_Channel5_IRQHandler_Base:
    call DMA2_Channel5_IRQHandler
    mret

ETH_IRQHandler_Base:
    call ETH_IRQHandler
    mret

ETH_WKUP_IRQHandler_Base:
    call ETH_WKUP_IRQHandler
    mret

CAN2_TX_IRQHandler_Base:
    call CAN2_TX_IRQHandler
    mret

CAN2_RX0_IRQHandler_Base:
    call CAN2_RX0_IRQHandler
    mret

CAN2_RX1_IRQHandler_Base:
    call CAN2_RX1_IRQHandler
    mret

CAN2_SCE_IRQHandler_Base:
    call CAN2_SCE_IRQHandler
    mret

OTG_FS_IRQHandler_Base:
    call OTG_FS_IRQHandler
    mret

USBHSWakeup_IRQHandler_Base:
    call USBHSWakeup_IRQHandler
    mret

USBHS_IRQHandler_Base:
    call USBHS_IRQHandler
    mret

DVP_IRQHandler_Base:
    call DVP_IRQHandler
    mret

UART6_IRQHandler_Base:
    call UART6_IRQHandler
    mret

UART7_IRQHandler_Base:
    call UART7_IRQHandler
    mret

UART8_IRQHandler_Base:
    call UART8_IRQHandler
    mret

TIM9_BRK_IRQHandler_Base:
    call TIM9_BRK_IRQHandler
    mret

TIM9_UP_IRQHandler_Base:
    call TIM9_UP_IRQHandler
    mret

TIM9_TRG_COM_IRQHandler_Base:
    call TIM9_TRG_COM_IRQHandler
    mret

TIM9_CC_IRQHandler_Base:
    call TIM9_CC_IRQHandler
    mret

TIM10_BRK_IRQHandler_Base:
    call TIM10_BRK_IRQHandler
    mret

TIM10_UP_IRQHandler_Base:
    call TIM10_UP_IRQHandler
    mret

TIM10_TRG_COM_IRQHandler_Base:
    call TIM10_TRG_COM_IRQHandler
    mret

TIM10_CC_IRQHandler_Base:
    call TIM10_CC_IRQHandler
    mret

DMA2_Channel6_IRQHandler_Base:
    call DMA2_Channel6_IRQHandler
    mret

DMA2_Channel7_IRQHandler_Base:
    call DMA2_Channel7_IRQHandler
    mret

DMA2_Channel8_IRQHandler_Base:
    call DMA2_Channel8_IRQHandler
    mret

DMA2_Channel9_IRQHandler_Base:
    call DMA2_Channel9_IRQHandler
    mret

DMA2_Channel10_IRQHandler_Base:
    call DMA2_Channel10_IRQHandler
    mret

DMA2_Channel11_IRQHandler_Base:
    call DMA2_Channel11_IRQHandler
    mret

    .weak   NMI_Handler                /* NMI */
    .weak   HardFault_Handler          /* Hard Fault */
    .weak   Ecall_M_Mode_Handler       /* Ecall M Mode */
    .weak   Ecall_U_Mode_Handler       /* Ecall U Mode */
    .weak   Break_Point_Handler        /* Break Point */
    .weak   SysTick_Handler            /* SysTick */
    .weak   SW_handler                 /* SW */
    .weak   WWDG_IRQHandler            /* Window Watchdog */
    .weak   PVD_IRQHandler             /* PVD through EXTI Line detect */
    .weak   TAMPER_IRQHandler          /* TAMPER */
    .weak   RTC_IRQHandler             /* RTC */
    .weak   FLASH_IRQHandler           /* Flash */
    .weak   RCC_IRQHandler             /* RCC */
    .weak   EXTI0_IRQHandler           /* EXTI Line 0 */
    .weak   EXTI1_IRQHandler           /* EXTI Line 1 */
    .weak   EXTI2_IRQHandler           /* EXTI Line 2 */
    .weak   EXTI3_IRQHandler           /* EXTI Line 3 */
    .weak   EXTI4_IRQHandler           /* EXTI Line 4 */
    .weak   DMA1_Channel1_IRQHandler   /* DMA1 Channel 1 */
    .weak   DMA1_Channel2_IRQHandler   /* DMA1 Channel 2 */
    .weak   DMA1_Channel3_IRQHandler   /* DMA1 Channel 3 */
    .weak   DMA1_Channel4_IRQHandler   /* DMA1 Channel 4 */
    .weak   DMA1_Channel5_IRQHandler   /* DMA1 Channel 5 */
    .weak   DMA1_Channel6_IRQHandler   /* DMA1 Channel 6 */
    .weak   DMA1_Channel7_IRQHandler   /* DMA1 Channel 7 */
    .weak   ADC1_2_IRQHandler          /* ADC1_2 */
    .weak   USB_HP_CAN1_TX_IRQHandler  /* USB HP and CAN1 TX */
    .weak   USB_LP_CAN1_RX0_IRQHandler /* USB LP and CAN1RX0 */
    .weak   CAN1_RX1_IRQHandler        /* CAN1 RX1 */
    .weak   CAN1_SCE_IRQHandler        /* CAN1 SCE */
    .weak   EXTI9_5_IRQHandler         /* EXTI Line 9..5 */
    .weak   TIM1_BRK_IRQHandler        /* TIM1 Break */
    .weak   TIM1_UP_IRQHandler         /* TIM1 Update */
    .weak   TIM1_TRG_COM_IRQHandler    /* TIM1 Trigger and Commutation */
    .weak   TIM1_CC_IRQHandler         /* TIM1 Capture Compare */
    .weak   TIM2_IRQHandler            /* TIM2 */
    .weak   TIM3_IRQHandler            /* TIM3 */
    .weak   TIM4_IRQHandler            /* TIM4 */
    .weak   I2C1_EV_IRQHandler         /* I2C1 Event */
    .weak   I2C1_ER_IRQHandler         /* I2C1 Error */
    .weak   I2C2_EV_IRQHandler         /* I2C2 Event */
    .weak   I2C2_ER_IRQHandler         /* I2C2 Error */
    .weak   SPI1_IRQHandler            /* SPI1 */
    .weak   SPI2_IRQHandler            /* SPI2 */
    .weak   USART1_IRQHandler          /* USART1 */
    .weak   USART2_IRQHandler          /* USART2 */
    .weak   USART3_IRQHandler          /* USART3 */
    .weak   EXTI15_10_IRQHandler       /* EXTI Line 15..10 */
    .weak   RTCAlarm_IRQHandler        /* RTC Alarm through EXTI Line */
    .weak   USBWakeUp_IRQHandler       /* USB Wakeup from suspend */
    .weak   TIM8_BRK_IRQHandler        /* TIM8 Break */
    .weak   TIM8_UP_IRQHandler         /* TIM8 Update */
    .weak   TIM8_TRG_COM_IRQHandler    /* TIM8 Trigger and Commutation */
    .weak   TIM8_CC_IRQHandler         /* TIM8 Capture Compare */
    .weak   RNG_IRQHandler             /* RNG */
    .weak   FSMC_IRQHandler            /* FSMC */
    .weak   SDIO_IRQHandler            /* SDIO */
    .weak   TIM5_IRQHandler            /* TIM5 */
    .weak   SPI3_IRQHandler            /* SPI3 */
    .weak   UART4_IRQHandler           /* UART4 */
    .weak   UART5_IRQHandler           /* UART5 */
    .weak   TIM6_IRQHandler            /* TIM6 */
    .weak   TIM7_IRQHandler            /* TIM7 */
    .weak   DMA2_Channel1_IRQHandler   /* DMA2 Channel 1 */
    .weak   DMA2_Channel2_IRQHandler   /* DMA2 Channel 2 */
    .weak   DMA2_Channel3_IRQHandler   /* DMA2 Channel 3 */
    .weak   DMA2_Channel4_IRQHandler   /* DMA2 Channel 4 */
    .weak   DMA2_Channel5_IRQHandler   /* DMA2 Channel 5 */
    .weak   ETH_IRQHandler             /* ETH */
    .weak   ETH_WKUP_IRQHandler        /* ETH WakeUp */
    .weak   CAN2_TX_IRQHandler         /* CAN2 TX */
    .weak   CAN2_RX0_IRQHandler        /* CAN2 RX0 */
    .weak   CAN2_RX1_IRQHandler        /* CAN2 RX1 */
    .weak   CAN2_SCE_IRQHandler        /* CAN2 SCE */
    .weak   OTG_FS_IRQHandler          /* OTGFS */
    .weak   USBHSWakeup_IRQHandler     /* USBHS Wakeup */
    .weak   USBHS_IRQHandler           /* USBHS */
    .weak   DVP_IRQHandler             /* DVP */
    .weak   UART6_IRQHandler           /* UART6 */
    .weak   UART7_IRQHandler           /* UART7 */
    .weak   UART8_IRQHandler           /* UART8 */
    .weak   TIM9_BRK_IRQHandler        /* TIM9 Break */
    .weak   TIM9_UP_IRQHandler         /* TIM9 Update */
    .weak   TIM9_TRG_COM_IRQHandler    /* TIM9 Trigger and Commutation */
    .weak   TIM9_CC_IRQHandler         /* TIM9 Capture Compare */
    .weak   TIM10_BRK_IRQHandler       /* TIM10 Break */
    .weak   TIM10_UP_IRQHandler        /* TIM10 Update */
    .weak   TIM10_TRG_COM_IRQHandler   /* TIM10 Trigger and Commutation */
    .weak   TIM10_CC_IRQHandler        /* TIM10 Capture Compare */
    .weak   DMA2_Channel6_IRQHandler   /* DMA2 Channel 6 */
    .weak   DMA2_Channel7_IRQHandler   /* DMA2 Channel 7 */
    .weak   DMA2_Channel8_IRQHandler   /* DMA2 Channel 8 */
    .weak   DMA2_Channel9_IRQHandler   /* DMA2 Channel 9 */
    .weak   DMA2_Channel10_IRQHandler  /* DMA2 Channel 10 */
    .weak   DMA2_Channel11_IRQHandler  /* DMA2 Channel 11 */

NMI_Handler:  1:  j 1b
HardFault_Handler:  1:  j 1b
Ecall_M_Mode_Handler:  1:  j 1b
Ecall_U_Mode_Handler:  1:  j 1b
Break_Point_Handler:  1:  j 1b
SysTick_Handler:  1:  j 1b
SW_handler:  1:  j 1b
WWDG_IRQHandler:  1:  j 1b
PVD_IRQHandler:  1:  j 1b
TAMPER_IRQHandler:  1:  j 1b
RTC_IRQHandler:  1:  j 1b
FLASH_IRQHandler:  1:  j 1b
RCC_IRQHandler:  1:  j 1b
EXTI0_IRQHandler:  1:  j 1b
EXTI1_IRQHandler:  1:  j 1b
EXTI2_IRQHandler:  1:  j 1b
EXTI3_IRQHandler:  1:  j 1b
EXTI4_IRQHandler:  1:  j 1b
DMA1_Channel1_IRQHandler:  1:  j 1b
DMA1_Channel2_IRQHandler:  1:  j 1b
DMA1_Channel3_IRQHandler:  1:  j 1b
DMA1_Channel4_IRQHandler:  1:  j 1b
DMA1_Channel5_IRQHandler:  1:  j 1b
DMA1_Channel6_IRQHandler:  1:  j 1b
DMA1_Channel7_IRQHandler:  1:  j 1b
ADC1_2_IRQHandler:  1:  j 1b
USB_HP_CAN1_TX_IRQHandler:  1:  j 1b
USB_LP_CAN1_RX0_IRQHandler:  1:  j 1b
CAN1_RX1_IRQHandler:  1:  j 1b
CAN1_SCE_IRQHandler:  1:  j 1b
EXTI9_5_IRQHandler:  1:  j 1b
TIM1_BRK_IRQHandler:  1:  j 1b
TIM1_UP_IRQHandler:  1:  j 1b
TIM1_TRG_COM_IRQHandler:  1:  j 1b
TIM1_CC_IRQHandler:  1:  j 1b
TIM2_IRQHandler:  1:  j 1b
TIM3_IRQHandler:  1:  j 1b
TIM4_IRQHandler:  1:  j 1b
I2C1_EV_IRQHandler:  1:  j 1b
I2C1_ER_IRQHandler:  1:  j 1b
I2C2_EV_IRQHandler:  1:  j 1b
I2C2_ER_IRQHandler:  1:  j 1b
SPI1_IRQHandler:  1:  j 1b
SPI2_IRQHandler:  1:  j 1b
USART1_IRQHandler:  1:  j 1b
USART2_IRQHandler:  1:  j 1b
USART3_IRQHandler:  1:  j 1b
EXTI15_10_IRQHandler:  1:  j 1b
RTCAlarm_IRQHandler:  1:  j 1b
USBWakeUp_IRQHandler:  1:  j 1b
TIM8_BRK_IRQHandler:  1:  j 1b
TIM8_UP_IRQHandler:  1:  j 1b
TIM8_TRG_COM_IRQHandler:  1:  j 1b
TIM8_CC_IRQHandler:  1:  j 1b
RNG_IRQHandler:  1:  j 1b
FSMC_IRQHandler:  1:  j 1b
SDIO_IRQHandler:  1:  j 1b
TIM5_IRQHandler:  1:  j 1b
SPI3_IRQHandler:  1:  j 1b
UART4_IRQHandler:  1:  j 1b
UART5_IRQHandler:  1:  j 1b
TIM6_IRQHandler:  1:  j 1b
TIM7_IRQHandler:  1:  j 1b
DMA2_Channel1_IRQHandler:  1:  j 1b
DMA2_Channel2_IRQHandler:  1:  j 1b
DMA2_Channel3_IRQHandler:  1:  j 1b
DMA2_Channel4_IRQHandler:  1:  j 1b
DMA2_Channel5_IRQHandler:  1:  j 1b
ETH_IRQHandler:  1:  j 1b
ETH_WKUP_IRQHandler:  1:  j 1b
CAN2_TX_IRQHandler:  1:  j 1b
CAN2_RX0_IRQHandler:  1:  j 1b
CAN2_RX1_IRQHandler:  1:  j 1b
CAN2_SCE_IRQHandler:  1:  j 1b
OTG_FS_IRQHandler:  1:  j 1b
USBHSWakeup_IRQHandler:  1:  j 1b
USBHS_IRQHandler:  1:  j 1b
DVP_IRQHandler:  1:  j 1b
UART6_IRQHandler:  1:  j 1b
UART7_IRQHandler:  1:  j 1b
UART8_IRQHandler:  1:  j 1b
TIM9_BRK_IRQHandler:  1:  j 1b
TIM9_UP_IRQHandler:  1:  j 1b
TIM9_TRG_COM_IRQHandler:  1:  j 1b
TIM9_CC_IRQHandler:  1:  j 1b
TIM10_BRK_IRQHandler:  1:  j 1b
TIM10_UP_IRQHandler:  1:  j 1b
TIM10_TRG_COM_IRQHandler:  1:  j 1b
TIM10_CC_IRQHandler:  1:  j 1b
DMA2_Channel6_IRQHandler:  1:  j 1b
DMA2_Channel7_IRQHandler:  1:  j 1b
DMA2_Channel8_IRQHandler:  1:  j 1b
DMA2_Channel9_IRQHandler:  1:  j 1b
DMA2_Channel10_IRQHandler:  1:  j 1b
DMA2_Channel11_IRQHandler:  1:  j 1b

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

    /* Enable nested and hardware stack */
	li t0, 0x1f
	csrw 0x804, t0
#	csrw 0x804, zero

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

