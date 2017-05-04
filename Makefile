TD=./testdata/

test: testWithHeader testWoHeader

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

clean:
	@rm -f *~
	@rm -f ${TD}/testWithHeader-output
	@rm -f ${TD}/testWoHeader-output
