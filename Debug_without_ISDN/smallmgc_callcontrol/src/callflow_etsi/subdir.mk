################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../smallmgc_callcontrol/src/callflow_etsi/smallmgc_etsi_messagebuilder.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsichangefaxfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsichangemodemfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsifaxestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsifsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiidlefsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiinprogressfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsimodemestablishedfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsireleasingfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiringingfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsistartedfsm.cpp \
../smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiwaitingnumberfsm.cpp 

OBJS += \
./smallmgc_callcontrol/src/callflow_etsi/smallmgc_etsi_messagebuilder.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsichangefaxfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsichangemodemfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsifaxestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsifsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiidlefsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiinprogressfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsimodemestablishedfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsireleasingfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiringingfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsistartedfsm.o \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiwaitingnumberfsm.o 

CPP_DEPS += \
./smallmgc_callcontrol/src/callflow_etsi/smallmgc_etsi_messagebuilder.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsichangefaxfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsichangemodemfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsifaxestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsifsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiidlefsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiinprogressfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsimodemestablishedfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsireleasingfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiringingfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsistartedfsm.d \
./smallmgc_callcontrol/src/callflow_etsi/smallmgcetsiwaitingnumberfsm.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_callcontrol/src/callflow_etsi/%.o: ../smallmgc_callcontrol/src/callflow_etsi/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -O0 -g3 -p -pg -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


