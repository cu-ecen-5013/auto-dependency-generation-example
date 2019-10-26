# See http://make.mad-scientist.net/papers/advanced-auto-dependency-generation/
# for the template used to start this file
SRCS := main.c file1.c file2.c
APPNAME = depend-generation-test

OBJFILES := $(SRCS:%.c=%.o)

all : $(APPNAME)

clean : ; @rm -rf $(APNAME) *.o

$(APPNAME) : $(OBJFILES)
	$(CC) $(LDFLAGS) $^ -o $(APPNAME)

CFLAGS += -Wall -Werror

# The below content is from  http://make.mad-scientist.net/papers/advanced-auto-dependency-generation/
DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

COMPILE.c = $(CC) $(DEPFLAGS) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c

%.o : %.c
%.o : %.c $(DEPDIR)/%.d | $(DEPDIR)
	$(COMPILE.c) $(OUTPUT_OPTION) $<

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(SRCS:%.c=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
