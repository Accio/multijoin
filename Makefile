test: testWithHeader testWoHeader

testWithHeader:testWithHeader-output  testWithHeader-expectedOutput
	diff testWithHeader-output testWithHeader-expectedOutput

testWithHeader-output: file1 file2 file3
	./multijoin -H file1 file2 file3 > testWithHeader-output
	@cat testWithHeader-output

testWoHeader: testWoHeade-output testWoHeader-expectedOutput
	diff testWoHeader-output testWoHeader-expectedOutput

testWoHeade-output:nh-file1 nh-file2 nh-file3
	./multijoin nh-file1 nh-file2 nh-file3 > testWoHeader-output
	@cat testWoHeader-output
