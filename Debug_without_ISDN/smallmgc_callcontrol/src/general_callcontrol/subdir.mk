################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccchangefaxfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccchangemodemfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccestablishedfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccfaxestablishedfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccidlefsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccinprogressfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccmodemestablishedfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccreleasingfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccringingfsm.cpp \
../smallmgc_callcontrol/src/general_callcontrol/smallmgcgccstartedfsm.cpp 

OBJS += \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccchangefaxfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccchangemodemfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccestablishedfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccfaxestablishedfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccidlefsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccinprogressfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccmodemestablishedfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccreleasingfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccringingfsm.o \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccstartedfsm.o 

CPP_DEPS += \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccchangefaxfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccchangemodemfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccestablishedfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccfaxestablishedfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccidlefsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccinprogressfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccmodemestablishedfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccreleasingfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccringingfsm.d \
./smallmgc_callcontrol/src/general_callcontrol/smallmgcgccstartedfsm.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_callcontrol/src/general_callcontrol/%.o: ../smallmgc_callcontrol/src/general_callcontrol/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -O0 -g3 -p -pg -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


