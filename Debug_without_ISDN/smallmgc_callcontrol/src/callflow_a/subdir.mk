################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../smallmgc_callcontrol/src/callflow_a/h248stack_a_messagebuilder.cpp \
../smallmgc_callcontrol/src/callflow_a/smallmgcaccestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_a/smallmgcaccfsm.cpp \
../smallmgc_callcontrol/src/callflow_a/smallmgcaccidlefsm.cpp \
../smallmgc_callcontrol/src/callflow_a/smallmgcaccinprogressfsm.cpp \
../smallmgc_callcontrol/src/callflow_a/smallmgcaccreleasingfsm.cpp \
../smallmgc_callcontrol/src/callflow_a/smallmgcaccringingfsm.cpp \
../smallmgc_callcontrol/src/callflow_a/smallmgcaccstartedfsm.cpp 

OBJS += \
./smallmgc_callcontrol/src/callflow_a/h248stack_a_messagebuilder.o \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccfsm.o \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccidlefsm.o \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccinprogressfsm.o \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccreleasingfsm.o \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccringingfsm.o \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccstartedfsm.o 

CPP_DEPS += \
./smallmgc_callcontrol/src/callflow_a/h248stack_a_messagebuilder.d \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccfsm.d \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccidlefsm.d \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccinprogressfsm.d \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccreleasingfsm.d \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccringingfsm.d \
./smallmgc_callcontrol/src/callflow_a/smallmgcaccstartedfsm.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_callcontrol/src/callflow_a/%.o: ../smallmgc_callcontrol/src/callflow_a/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -O0 -g3 -p -pg -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


