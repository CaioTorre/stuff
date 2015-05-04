def waitForSafeInput num, message
	isOk = false
	while !isOk
		print message
		input = gets.chomp
		if (num) 
			input = input.to_i
		else
			input = input.to_s.downcase
		end
		isOk = !(input.empty?)
		if (!isOk)
			puts "Invalid input"
		end
	end
	return input
end
puts
puts "================="
puts "Welcome to Enigma"
puts "================="
puts
alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
#alphabetH = Hash.(alphabet.map.with_index.to_a)
alphabetH = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7, "i" => 8, "j" => 9, "k" => 10, "l" => 11, "m" => 12, "n" => 13, "o" => 14, "p" => 15, "q" => 16, "r" => 17, "s" => 18, "t" => 19, "u" => 20, "v" => 21, "w" => 22, "x" => 23, "y" => 24, "z" => 25 }
savedOutputs = []
while true
    maintain = true
    result = ""
    printSpacer = ""
    firstMod = 0
    secondMod = 0
    thirdMod = 0
    keys = [16, 4, 21, 9, 25]
    #define Rotors
    rotorOneBR =     	[4, 10, 12, 5, 11, 6, 3, 16, 21, 25, 13, 19, 14, 22, 24, 7, 23, 20, 18, 15, 0, 8, 1, 17, 2, 9]
    rotorTwoBR =     	[0, 9, 3, 10, 18, 8, 17, 20, 23, 1, 11, 7, 22, 19, 12, 2, 16, 6, 25, 13, 15, 24, 5, 21, 14, 4]
    rotorThreeBR =    	[1, 3, 5, 7, 9, 11, 2, 15, 17, 19, 23, 21, 25, 13, 24, 4, 8, 22, 6, 0, 10, 12, 20, 18, 16, 14]
    rotorFourBR =    	[4, 18, 14, 21, 15, 25, 9, 0, 24, 16, 20, 8, 17, 7, 23, 11, 13, 5, 19, 6, 10, 3, 2, 12, 22, 1]
    rotorFiveBR =    	[21, 25, 1, 17, 6, 8, 19, 24, 20, 15, 18, 3, 13, 7, 11, 23, 0, 22, 12, 9, 16, 14, 5, 4, 2, 10]
    rotorOneAR =     	[20, 22, 24, 6, 0, 3, 5, 15, 21, 25, 1, 4, 2, 10, 12, 19, 7, 23, 18, 11, 17, 8, 13, 16, 14, 9]
    rotorTwoAR =     	[0, 9, 15, 2, 25, 22, 17, 11, 5, 1, 3, 10, 14, 19, 24, 20, 16, 6, 4, 13, 7, 23, 12, 8, 21, 18]
    rotorThreeAR =     	[19, 0, 6, 1, 15, 2, 18, 3, 16, 4, 20, 5, 21, 13, 25, 7, 24, 8, 23, 9, 22, 11, 17, 10, 14, 12]
    rotorFourAR =     	[7, 25, 22, 21, 0, 17, 19, 13, 11, 6, 20, 15, 23, 16, 2, 4, 9, 12, 1, 18, 10, 3, 24, 14, 8, 5]
    rotorFiveAR =     	[16, 2, 24, 11, 23, 22, 4, 15, 5, 19, 25, 14, 18, 12, 21, 9, 20, 3, 10, 6, 8, 0, 17, 15, 7, 1]
    allRotorsBR = 		[rotorOneBR, rotorTwoBR, rotorThreeBR, rotorFourBR, rotorFiveBR]
    allRotorsAR = 		[rotorOneAR, rotorTwoAR, rotorThreeAR, rotorFourAR, rotorFiveAR]
    #Define Reflectors
    reflectorB =     	[24, 17, 20, 7, 16, 18, 11, 3, 15, 23, 13, 6, 14, 10, 12, 8, 4, 1, 5, 25, 2, 22, 21, 9, 0, 19]
    reflectorC =     	[5, 21, 15, 9, 8, 0, 14, 24, 4, 3, 17, 25, 23, 22, 6, 2, 19, 10, 20, 16, 18, 1, 13, 12, 7, 11]
    allReflectors = 	[reflectorB, reflectorC]
    isOk = false
    while !isOk
        print "First rotor id: "
        fRID = gets.chomp.to_i
        if fRID > 5 or fRID < 1
            puts "Out of range"
        else
            isOk = true
        end
    end
    fRID = fRID - 1
    print "First rotor ring setting: "
    fRRS = gets.chomp
    fRRSI = alphabetH[fRRS]
    print "First rotor initial setting: "
    fRIS = gets.chomp
    isOk = false
    while !isOk
        print "Second rotor id: "
        sRID = gets.chomp.to_i
        if sRID > 5 or sRID < 1
            puts "Out of range"
        else
            isOk = true
        end
    end
    sRID = sRID - 1
    print "Second rotor ring setting: "
    sRRS = gets.chomp
    sRRSI = alphabetH[sRRS]
    print "Second rotor initial setting: "
    sRIS = gets.chomp
    isOk = false
    while !isOk
        print "Third rotor id: "
        tRID = gets.chomp.to_i
        if tRID > 5 or tRID < 1
            puts "Out of range"
        else
            isOk = true
        end
    end
    tRID = tRID - 1
    print "Third rotor ring setting: "
    tRRS = gets.chomp
    tRRSI = alphabetH[tRRS]
    print "Third rotor initial setting: "
    tRIS = gets.chomp
    rotorOrder = [fRID, sRID, tRID]
    isOK = false
    while !isOK
        print "Reflector to use: "
        rID = gets.chomp
        if rID == "b" or rID == "c"
            isOK = true        
        else
            puts "Unknown reflector"
        end
    end
    if rID == "b"
        reflectorToUse = 0
    else
        reflectorToUse = 1
    end
	print "Want to set up the plugboard? (Y/n)"
	usePlugboard = gets.chomp.downcase == "y"
	alphabetIDS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
    if (usePlugboard)
		print "Plugboard pair 1: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 2: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 3: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 4: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
   	 	print "Plugboard pair 5: "
   	 	firstPE = alphabetH[gets.chomp]
   	 	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 6: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 7: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 8: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 9: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
    	print "Plugboard pair 10: "
    	firstPE = alphabetH[gets.chomp]
    	print "Swap for: "
    	firstPI = alphabetH[gets.chomp]
    	alphabetIDS[firstPE] = firstPI
    	alphabetIDS[firstPI] = firstPE
	end
	puts alphabetIDS
    puts "------------------------------"
    puts "Initial configuration complete"
    puts "------------------------------"
    doubleStep = 0
    firstModded = 0
    secondModded = 0
    thirdModded = 0
    # Interpret initial settings
    fRISI = alphabetH[fRIS]
    firstMod = fRISI - fRRSI - 1
    puts firstMod
    sRISI = alphabetH[sRIS]
    secondMod = sRISI - sRRSI - 1
    puts secondMod
    tRISI = alphabetH[tRIS]
    thirdMod = tRISI - tRRSI
    puts thirdMod
    currRotOneBR = allRotorsBR[fRID]
    currRotOneAR = allRotorsAR[fRID]
    currRotTwoBR = allRotorsBR[sRID]
    currRotTwoAR = allRotorsAR[sRID]
    currRotThreeBR = allRotorsBR[tRID]
    currRotThreeAR = allRotorsAR[tRID]
	writtenOutputs = []
    while maintain
        #print "Input: "
        inputCMD = waitForSafeInput(false, "Input: ")
        case inputCMD
        when "over"
		writtenOutputs = []
            puts
            puts "+++++++++++RESTARTING+++++++++++"
            puts
            maintain = false
        when "space"
            result << " "
            printSpacer << "-"
            puts "______________"
        when "print"
            puts printSpacer
            puts result
            puts printSpacer
		when "clear"
			printSpacer = ""
			result = ""
		when "write"
			writtenOutputs.insert(0, result)
		when "save"
			savedOutputs.insert(0, result)
		when "output written"
			print writtenOutputs
			puts
		when "output saved"
			print savedOutputs
			puts
		when "clear saved"
			savedOutputs = []
		when "clear written"
			writtenOutputs = []
        else
			#if (!inputCMD.empty?)
            inputLetter = inputCMD
            #inputLetterID = alphabetH[inputLetter]
            inputLetterID = alphabetIDS[alphabetH[inputLetter]]
            print alphabetIDS
            puts
            puts inputLetterID
            puts alphabet[inputLetterID]
            for i in 0..firstMod
                firstFBR = currRotOneBR.shift
                currRotOneBR.push(firstFBR)
                firstFAR = currRotOneAR.shift
                currRotOneAR.push(firstFAR)
                firstModded = firstModded + 1
                puts "Turned first"
            end
            for i in 0..secondMod
                firstSBR = currRotTwoBR.shift
                currRotTwoBR.push(firstSBR)
                firstSAR = currRotTwoAR.shift
                currRotTwoAR.push(firstSAR)
                secondModded = secondModded + 1
                puts "Turned second"
            end
            for i in 0..thirdMod
                firstTBR = currRotThreeBR.shift
                currRotThreeBR.push(firstTBR)
                firstTAR = currRotThreeAR.shift
                currRotThreeAR.push(firstTAR)
                thirdModded = thirdModded + 1
                puts "Turned third"
            end
            if doubleStep == 1
                firstSBR = currRotTwoBR.shift
                currRotTwoBR.push(firstSBR)
                firstSAR = currRotTwoAR.shift
                currRotTwoAR.push(firstSAR)
                secondModded = secondModded + 1
                puts "Turned second"
            end
            #AR -> / BR <-
            #MAGIC third rotor -> allRotors[rotorOrder[2]]
            #outputLetterID = alphabetH[allRotorsAR[rotorOrder[2]][allRotorsAR[rotorOrder[1]][allRotorsAR[rotorOrder[0]][allReflectors[reflectorToUse]][allRotorsBR[rotorOrder[0]][allRotorsBR[rotorOrder[1]][allRotorsBR[rotorOrder[2]]]]]]]
            ##puts alphabet[currRotThreeBR[inputLetterID]]
            ##puts thirdModded
            ##puts alphabet[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded]]
            ##puts alphabet[currRotOneBR[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded] - secondModded]]
            ##puts "Reflected"
            ##puts alphabet[reflectorB[currRotOneBR[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded] - secondModded] - firstModded]] #Reflector
            ##puts "Passed"
            ##puts alphabet[currRotOneAR[reflectorB[currRotOneBR[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded] - secondModded] - firstModded]] - firstModded]
            ##puts alphabet[currRotTwoAR[currRotOneAR[reflectorB[currRotOneBR[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded] - secondModded] - firstModded]] - firstModded] - secondModded]
            ##puts alphabet[currRotThreeAR[currRotTwoAR[currRotOneAR[reflectorB[currRotOneBR[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded] - secondModded] - firstModded]] - firstModded] - secondModded] - thirdModded]
            
            outputLetterIDBPB = currRotThreeAR[currRotTwoAR[currRotOneAR[reflectorB[currRotOneBR[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded] - secondModded] - firstModded]] - firstModded] - secondModded] - thirdModded
            print "Before Plugboard: "
            puts alphabet[outputLetterIDBPB]
            print "Output: "
            puts alphabet[alphabetIDS[outputLetterIDBPB]]
            puts "______________"
            ##result << alphabet[currRotThreeAR[currRotTwoAR[currRotOneAR[reflectorB[currRotOneBR[currRotTwoBR[currRotThreeBR[inputLetterID] - thirdModded] - secondModded] - firstModded]] - firstModded] - secondModded] - thirdModded]
            result << alphabet[alphabetIDS[outputLetterIDBPB]]
            printSpacer << "-"
            if secondModded == keys[sRID]
                firstMod = 0
                secondMod = 0
                thirdMod = 0
            elsif thirdModded == keys[tRID]
                firstMod = -1
                secondMod = 0
                thirdMod = 0
            else
                firstMod = -1
                secondMod = -1
                thirdMod = 0
            end
            
            if secondModded == keys[sRID] and thirdModded == keys[tRID]
                doubleStep = 2
            else
                doubleStep = doubleStep - 1
            end
			#end
        end
    end
end