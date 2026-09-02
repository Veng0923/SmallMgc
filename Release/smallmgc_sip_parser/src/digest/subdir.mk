################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../smallmgc_sip_parser/src/digest/digest.c \
../smallmgc_sip_parser/src/digest/digest_parser.c \
../smallmgc_sip_parser/src/digest/param_parser.c 

OBJS += \
./smallmgc_sip_parser/src/digest/digest.o \
./smallmgc_sip_parser/src/digest/digest_parser.o \
./smallmgc_sip_parser/src/digest/param_parser.o 

C_DEPS += \
./smallmgc_sip_parser/src/digest/digest.d \
./smallmgc_sip_parser/src/digest/digest_parser.d \
./smallmgc_sip_parser/src/digest/param_parser.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_sip_parser/src/digest/%.o: ../smallmgc_sip_parser/src/digest/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -m32 -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src/contact" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src/digest" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src/sdp" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp_sip/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -O0 -g3 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


