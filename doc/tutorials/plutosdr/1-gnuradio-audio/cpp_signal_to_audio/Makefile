LINK=arm-linux-g++
PKGCONFIG=$(BR_DIR)/output/host/bin/pkg-config
LIBS=$(shell $(PKGCONFIG) --libs gnuradio-analog gnuradio-filter gnuradio-audio)
LIBS+= $(SUBLIBS) -lrt -ldl -lpthread
LIBS+=-lgnuradio-runtime -lgnuradio-analog -lboost_system -lgnuradio-blocks

CFLAGS = -O2 -Wall -W -D_REENTRANT -fPIE $(DEFINES) -std=gnu++11 
CXXFLAGS = -I$(BR_DIR)/output/staging/usr/include
CXXFLAGS+= $(shell $(PKGCONFIG) --cflags gnuradio-analog gnuradio-filter gnuradio-audio)
CXXFLAGS+= -Os -O2 -O3 -Wall -W -D_REENTRANT -fPIE $(DEFINES) $(INCPATH) -std=gnu++11

TARGET=cpp_signal_to_audio
SRC=$(wildcard *.cpp)
OBJS=$(SRC:.cpp=.o)

ALL: $(TARGET)

$(TARGET):$(OBJS)
	$(LINK) $(LFLAGS) -o $(@) $< $(OBJCOMP) $(LIBS)

%.o:%.cpp
	$(LINK) $(CXXFLAGS) -o $@ -c $<

clean:
	rm -f $(TARGET) $(OBJS)
