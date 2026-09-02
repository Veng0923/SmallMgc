################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../smallmgc_h248_parser/src/Callbacks.cpp \
../smallmgc_h248_parser/src/h248stack_commands.cpp \
../smallmgc_h248_parser/src/h248stack_message.cpp \
../smallmgc_h248_parser/src/h248stack_parser.cpp \
../smallmgc_h248_parser/src/h248stack_team.cpp \
../smallmgc_h248_parser/src/sub_h248_parser.cpp 

C_SRCS += \
../smallmgc_h248_parser/src/AST.c \
../smallmgc_h248_parser/src/Alert.c \
../smallmgc_h248_parser/src/DisplayAST.c \
../smallmgc_h248_parser/src/Errors.c \
../smallmgc_h248_parser/src/MEGACO.c \
../smallmgc_h248_parser/src/Memory.c \
../smallmgc_h248_parser/src/Nodes.c \
../smallmgc_h248_parser/src/Operators.c \
../smallmgc_h248_parser/src/Parser.c \
../smallmgc_h248_parser/src/Stats.c \
../smallmgc_h248_parser/src/SynCallbacks.c \
../smallmgc_h248_parser/src/Tnm.c \
../smallmgc_h248_parser/src/Tools.c \
../smallmgc_h248_parser/src/Trace.c \
../smallmgc_h248_parser/src/Vector.c 

OBJS += \
./smallmgc_h248_parser/src/AST.o \
./smallmgc_h248_parser/src/Alert.o \
./smallmgc_h248_parser/src/Callbacks.o \
./smallmgc_h248_parser/src/DisplayAST.o \
./smallmgc_h248_parser/src/Errors.o \
./smallmgc_h248_parser/src/MEGACO.o \
./smallmgc_h248_parser/src/Memory.o \
./smallmgc_h248_parser/src/Nodes.o \
./smallmgc_h248_parser/src/Operators.o \
./smallmgc_h248_parser/src/Parser.o \
./smallmgc_h248_parser/src/Stats.o \
./smallmgc_h248_parser/src/SynCallbacks.o \
./smallmgc_h248_parser/src/Tnm.o \
./smallmgc_h248_parser/src/Tools.o \
./smallmgc_h248_parser/src/Trace.o \
./smallmgc_h248_parser/src/Vector.o \
./smallmgc_h248_parser/src/h248stack_commands.o \
./smallmgc_h248_parser/src/h248stack_message.o \
./smallmgc_h248_parser/src/h248stack_parser.o \
./smallmgc_h248_parser/src/h248stack_team.o \
./smallmgc_h248_parser/src/sub_h248_parser.o 

C_DEPS += \
./smallmgc_h248_parser/src/AST.d \
./smallmgc_h248_parser/src/Alert.d \
./smallmgc_h248_parser/src/DisplayAST.d \
./smallmgc_h248_parser/src/Errors.d \
./smallmgc_h248_parser/src/MEGACO.d \
./smallmgc_h248_parser/src/Memory.d \
./smallmgc_h248_parser/src/Nodes.d \
./smallmgc_h248_parser/src/Operators.d \
./smallmgc_h248_parser/src/Parser.d \
./smallmgc_h248_parser/src/Stats.d \
./smallmgc_h248_parser/src/SynCallbacks.d \
./smallmgc_h248_parser/src/Tnm.d \
./smallmgc_h248_parser/src/Tools.d \
./smallmgc_h248_parser/src/Trace.d \
./smallmgc_h248_parser/src/Vector.d 

CPP_DEPS += \
./smallmgc_h248_parser/src/Callbacks.d \
./smallmgc_h248_parser/src/h248stack_commands.d \
./smallmgc_h248_parser/src/h248stack_message.d \
./smallmgc_h248_parser/src/h248stack_parser.d \
./smallmgc_h248_parser/src/h248stack_team.d \
./smallmgc_h248_parser/src/sub_h248_parser.d 


# Each subdirectory must supply rules for building sources it contributes
smallmgc_h248_parser/src/%.o: ../smallmgc_h248_parser/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -m32 -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sdp_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp_sip/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -O0 -g3 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

smallmgc_h248_parser/src/%.o: ../smallmgc_h248_parser/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DNO_MUTEXES -DNO_ISDN -D__KERNEL_STRICT_NAMES -D__linux__ -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_h248_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_api/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sip_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sdp_parser/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_h" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_n" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_a" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_etsi" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/callflow_isdn" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src/general_callcontrol" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_cli/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/api" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_database/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_gatewaycontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_iua/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_q931/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_sctp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_timer/src/stw/include" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_udp_sip/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_callcontrol/src" -I"/home/lsf/下载/smallmgc_0.043.000/smallmgc/smallmgc_test/src" -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -I/usr/include/Poco -m32 -O2 -g1 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


