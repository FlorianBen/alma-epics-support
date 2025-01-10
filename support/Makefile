#Makefile at top of application tree
TOP = .
include $(TOP)/configure/CONFIG

# Always build PCAS
ifdef PCAS
DIRS := $(DIRS) $(PCAS)
endif

DIRS := $(DIRS) $(AUTOSAVE)
ifdef AUTOSAVE
endif

ifdef SEQ
DIRS := $(DIRS) $(SEQ)
endif

ifdef SSCAN
DIRS := $(DIRS) $(SSCAN)
$(SSCAN)_DEPEND_DIRS += $(SEQ)
endif

# ifdef AUTOSAVE
# DIRS := $(DIRS) $(AUTOSAVE)
# $(FFMPEGSERVER)_DEPEND_DIRS += $(ADCORE)
# endif

# ifdef AUTOSAVE
# DIRS := $(DIRS) $(AUTOSAVE)
# $(FFMPEGSERVER)_DEPEND_DIRS += $(ADCORE)
# endif

# ifdef AUTOSAVE
# DIRS := $(DIRS) $(AUTOSAVE)
# $(FFMPEGSERVER)_DEPEND_DIRS += $(ADCORE)
# endif

include $(TOP)/configure/RULES_TOP

uninstallTargets = $(foreach dir, $(DIRS), $(dir)$(DIVIDER)uninstall)
uninstall: $(uninstallTargets)
define UNINSTALL_template
$(1)$(DIVIDER)uninstall:
	$(MAKE) -C $(1) uninstall
endef
$(foreach dir, $(DIRS), $(eval $(call UNINSTALL_template,$(dir))))
.PHONY: uninstall $(uninstallTargets)

realuninstallTargets = $(foreach dir, $(DIRS), $(dir)$(DIVIDER)realuninstall)
realuninstall: $(realuninstallTargets)
define REALUNINSTALL_template
$(1)$(DIVIDER)realuninstall:
	$(MAKE) -C $(1) realuninstall
endef
$(foreach dir, $(DIRS), $(eval $(call REALUNINSTALL_template,$(dir))))
.PHONY: realuninstall $(realuninstallTargets)