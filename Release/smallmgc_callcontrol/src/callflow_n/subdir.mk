################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../smallmgc_callcontrol/src/callflow_n/smallmgc_n_messagebuilder.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccchangefaxfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccchangemodemfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccfaxestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccidlefsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccinprogressfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccmodemestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccreleasingfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccringingfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccstartedfsm.cpp \
../smallmgc_callcontrol/src/callflow_n/smallmgcnccwaitingnumberfsm.cpp 

OBJS += \
./smallmgc_callcontrol/src/callflow_n/smallmgc_n_messagebuilder.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccchangefaxfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccchangemodemfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccfaxestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccidlefsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccinprogressfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccmodemestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccreleasingfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccringingfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccstartedfsm.o \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccwaitingnumberfsm.o 

CPP_DEPS += \
./smallmgc_callcontrol/src/callflow_n/smallmgc_n_messagebuilder.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccchangefaxfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccchangemodemfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccfaxestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccidlefsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccinprogressfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccmodemestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccreleasingfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccringingfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccstartedfsm.d \
./smallmgc_callcontrol/src/callflow_n/smallmgcnccwaitingnumberfsm.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_callcontrol/src/callflow_n/%.o: ../smallmgc_callcontrol/src/callflow_n/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sdp_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp_sip/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -m32 -O2 -g1 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


