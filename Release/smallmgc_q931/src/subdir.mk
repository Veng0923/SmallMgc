################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../smallmgc_q931/src/Q931_Ies.cpp \
../smallmgc_q931/src/Q931_ie.cpp \
../smallmgc_q931/src/q931adapter.cpp \
../smallmgc_q931/src/q931call.cpp \
../smallmgc_q931/src/q931callcontrol.cpp \
../smallmgc_q931/src/q931ccbmessage.cpp \
../smallmgc_q931/src/q931ces.cpp \
../smallmgc_q931/src/q931channel.cpp \
../smallmgc_q931/src/q931datalink.cpp \
../smallmgc_q931/src/q931decoderstatus.cpp \
../smallmgc_q931/src/q931globalfsm.cpp \
../smallmgc_q931/src/q931iecallstate.cpp \
../smallmgc_q931/src/q931interface.cpp \
../smallmgc_q931/src/q931message.cpp \
../smallmgc_q931/src/sub_q931.cpp \
../smallmgc_q931/src/sub_q931_base.cpp 

OBJS += \
./smallmgc_q931/src/Q931_Ies.o \
./smallmgc_q931/src/Q931_ie.o \
./smallmgc_q931/src/q931adapter.o \
./smallmgc_q931/src/q931call.o \
./smallmgc_q931/src/q931callcontrol.o \
./smallmgc_q931/src/q931ccbmessage.o \
./smallmgc_q931/src/q931ces.o \
./smallmgc_q931/src/q931channel.o \
./smallmgc_q931/src/q931datalink.o \
./smallmgc_q931/src/q931decoderstatus.o \
./smallmgc_q931/src/q931globalfsm.o \
./smallmgc_q931/src/q931iecallstate.o \
./smallmgc_q931/src/q931interface.o \
./smallmgc_q931/src/q931message.o \
./smallmgc_q931/src/sub_q931.o \
./smallmgc_q931/src/sub_q931_base.o 

CPP_DEPS += \
./smallmgc_q931/src/Q931_Ies.d \
./smallmgc_q931/src/Q931_ie.d \
./smallmgc_q931/src/q931adapter.d \
./smallmgc_q931/src/q931call.d \
./smallmgc_q931/src/q931callcontrol.d \
./smallmgc_q931/src/q931ccbmessage.d \
./smallmgc_q931/src/q931ces.d \
./smallmgc_q931/src/q931channel.d \
./smallmgc_q931/src/q931datalink.d \
./smallmgc_q931/src/q931decoderstatus.d \
./smallmgc_q931/src/q931globalfsm.d \
./smallmgc_q931/src/q931iecallstate.d \
./smallmgc_q931/src/q931interface.d \
./smallmgc_q931/src/q931message.d \
./smallmgc_q931/src/sub_q931.d \
./smallmgc_q931/src/sub_q931_base.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_q931/src/%.o: ../smallmgc_q931/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sdp_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp_sip/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -m32 -O2 -g1 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


