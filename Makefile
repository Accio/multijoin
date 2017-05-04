TD=./testdata/

test: testWithHeader testWoHeader testNfk

testWithHeader:${TD}/testWithHeader-output  ${TD}/testWithHeader-expectedOutput
	diff ${TD}/testWithHeader-output ${TD}/testWithHeader-expectedOutput

${TD}/testWithHeader-output: ${TD}/file1 ${TD}/file2 ${TD}/file3
	./multijoin -H ${TD}/file1 ${TD}/file2 ${TD}/file3 > ${TD}/testWithHeader-output
	@cat ${TD}/testWithHeader-output

testWoHeader: ${TD}/testWoHeade-output ${TD}/testWoHeader-expectedOutput
	diff ${TD}/testWoHeader-output ${TD}/testWoHeader-expectedOutput

${TD}/testWoHeade-output:${TD}/nh-file1 ${TD}/nh-file2 ${TD}/nh-file3
	./multijoin ${TD}/nh-file1 ${TD}/nh-file2 ${TD}/nh-file3 > ${TD}/testWoHeader-output
	@cat ${TD}/testWoHeader-output

## NFK = not first column is key
testNfk: ${TD}/testNfk-output ${TD}/testNfk-expectedOutput
	diff ${TD}/testNfk-output ${TD}/testNfk-expectedOutput

${TD}/testNfk-output: ${TD}/nfk-file1 ${TD}/nfk-file2 ${TD}/nfk-file3
	./multijoin -k 3 -v 1 -H ${TD}/nfk-file1 ${TD}/nfk-file2 ${TD}/nfk-file3 > ${TD}/testNfk-output
	@cat ${TD}/testNfk-output

## NFKNH = not first column is key, and  no header
testNfknh: ${TD}/testNfknh-output ${TD}/testNfknh-expectedOutput
	diff ${TD}/testNfknh-output ${TD}/testNfknh-expectedOutput

${TD}/testNfknh-output: ${TD}/nfknh-file1 ${TD}/nfknh-file2 ${TD}/nfknh-file3
	./multijoin -k 3 -v 1 ${TD}/nfknh-file1 ${TD}/nfknh-file2 ${TD}/nfknh-file3 > ${TD}/testNfknh-output
	@cat ${TD}/testNfknh-output

clean:
	@rm -f *~
	@rm -f ${TD}/testWithHeader-output
	@rm -f ${TD}/testWoHeader-output
