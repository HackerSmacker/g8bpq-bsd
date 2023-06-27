# BSDBPQ Makefile (BSD)

OBJS = pngwtran.o pngrtran.o pngset.o pngrio.o pngwio.o pngtrans.o pngrutil.o pngwutil.o \
 pngread.o pngwrite.o png.o pngerror.o pngget.o pngmem.o APRSIconData.o AISCommon.o \
 APRSStdPages.o HSMODEM.o WinRPR.o KISSHF.o TNCEmulators.o bpqhdlc.o SerialPort.o \
 adif.o WebMail.o utf8Routines.o VARA.o LzFind.o Alloc.o LzmaDec.o LzmaEnc.o LzmaLib.o \
 Multicast.o ARDOP.o IPCode.o FLDigi.o linether.o CMSAuth.o APRSCode.o BPQtoAGW.o KAMPactor.o \
 AEAPactor.o HALDriver.o MULTIPSK.o BBSHTMLConfig.o ChatHTMLConfig.o BBSUtilities.o bpqaxip.o \
 BPQINP3.o BPQNRR.o cMain.o Cmd.o CommonCode.o HTMLCommonCode.o compatbits.o config.o datadefs.o \
 FBBRoutines.o HFCommon.o Housekeeping.o HTTPcode.o kiss.o L2Code.o L3Code.o L4Code.o lzhuf32.o \
 MailCommands.o MailDataDefs.o LinBPQ.o MailRouting.o MailTCP.o MBLRoutines.o md5.o Moncode.o \
 NNTPRoutines.o RigControl.o TelnetV6.o WINMOR.o TNCCode.o UZ7HODrv.o WPRoutines.o \
 SCSTrackeMulti.o SCSPactor.o SCSTracker.o HanksRT.o  UIRoutines.o AGWAPI.o AGWMoncode.o \
 DRATS.o FreeDATA.o base64.o Events.o upnp.o

# Configuration:

CC = gcc
CFLAGS = -Wno-everything -DLINBPQ -MMD -g -fcommon
LDFLAGS = -Xlinker -Map=output.map
LDLIBS = -lrt -lm -lz -lpthread -lconfig -liconv -lpcap

all: bsdbpq

.SUFFIXES: .c .o

.c.o:
	$(CC) $(CFLAGS) -g -fcommon -c $< -o $@

bsdbpq: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) $(LDLIBS) -o bsdbpq

clean:
	rm -f bsdbpq $(OBJS)

