FLAGS = -Wall -g -O0 -Werror
#FLAGS += -DLRU_CACHE
CXXFLAGS += -std=c++0x $(FLAGS)
CFLAGS += -std=c99 -msse4.2 $(FLAGS)

CXXLIBS = -lboost_regex

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

%.o: %.c
	$(CC) $(CFLAGS) -c $<

all: ua_test

# unit test

UA_OBJS = test_ua.o userAgent.o \
                operatingSystem.o bot.o browser.o

OBJS_FOR_TEST = test.o userAgent.o operatingSystem.o bot.o browser.o

ua_test: $(UA_OBJS)
	$(CXX) -o $@ $(UA_OBJS) $(CXXLIBS)

test: $(OBJS_FOR_TEST)
	$(CXX) -o $@ $(OBJS_FOR_TEST) $(CXXLIBS)

.PHONY: clean
clean:
	rm -f *.o ua_test
