################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../smallmgc_callcontrol/src/callflow_isdn/h248stack_isdn_messagebuilder.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccfsm.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccidlefsm.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccinprogressfsm.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccreleasingfsm.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccringingfsm.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccstartedfsm.cpp \
../smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccwaitingnumberfsm.cpp 

OBJS += \
./smallmgc_callcontrol/src/callflow_isdn/h248stack_isdn_messagebuilder.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccfsm.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccidlefsm.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccinprogressfsm.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccreleasingfsm.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccringingfsm.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccstartedfsm.o \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccwaitingnumberfsm.o 

CPP_DEPS += \
./smallmgc_callcontrol/src/callflow_isdn/h248stack_isdn_messagebuilder.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccfsm.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccidlefsm.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccinprogressfsm.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccreleasingfsm.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccringingfsm.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccstartedfsm.d \
./smallmgc_callcontrol/src/callflow_isdn/smallmgcisdnccwaitingnumberfsm.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_callcontrol/src/callflow_isdn/%.o: ../smallmgc_callcontrol/src/callflow_isdn/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -O0 -g3 -p -pg -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


