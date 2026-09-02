################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include smallmgc_udp_sip/src/subdir.mk
-include smallmgc_udp/src/subdir.mk
-include smallmgc_timer/src/subdir.mk
-include smallmgc_timer/src/stw/src/subdir.mk
-include smallmgc_test/src/subdir.mk
-include smallmgc_sip_parser/src/subdir.mk
-include smallmgc_sdp_parser/src/subdir.mk
-include smallmgc_sctp/src/subdir.mk
-include smallmgc_q931/src/subdir.mk
-include smallmgc_iua/src/subdir.mk
-include smallmgc_h248_parser/src/subdir.mk
-include smallmgc_gatewaycontrol/src/subdir.mk
-include smallmgc_database/src/subdir.mk
-include smallmgc_cli/src/subdir.mk
-include smallmgc_callcontrol/src/subdir.mk
-include smallmgc_callcontrol/src/general_callcontrol/subdir.mk
-include smallmgc_callcontrol/src/callflow_n/subdir.mk
-include smallmgc_callcontrol/src/callflow_isdn/subdir.mk
-include smallmgc_callcontrol/src/callflow_h/subdir.mk
-include smallmgc_callcontrol/src/callflow_etsi/subdir.mk
-include smallmgc_callcontrol/src/callflow_a/subdir.mk
-include smallmgc_api/src/subdir.mk
-include api/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: smallmgc

# Tool invocations
smallmgc: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C++ Linker'
	g++ -L/usr/lib -L/lib -p -pg -o"smallmgc" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C++_DEPS)$(C_DEPS)$(CC_DEPS)$(CPP_DEPS)$(EXECUTABLES)$(CXX_DEPS)$(C_UPPER_DEPS) smallmgc
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
