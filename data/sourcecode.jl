using JWAS,DataFrames,CSV,Statistics,Printf

function readapp()

    # Step 2: Read data 
    phenofile = ""
    pedfile = ""
    genofile = ""

    while true
        println("Please enter the file path for your phenotypes CSV file. \n")
        input = readline()
        phenofile = input
        if isfile(phenofile)
            println("File found: ", input)
            println("(Press Enter to continue)")
            readline() 
            break 
        else
            println("Unable to locate file. Please try again.\n")
        end
    end
    println("(Press any key to continue)")
    readline()

    while true
        println("Please enter the file path for your pedigree CSV file. \n")
        input = readline()
        pedfile = input
        if isfile(pedfile)
            println("File found: ", input)
            println("(Press Enter to continue)")
            readline()  
            break 
        else
            println("Unable to locate file. Please try again.\n")
        end
    end
    println("(Press any key to continue)")
    readline()

    while true
        println("Please enter the file path for your genotypes CSV file. \n")
        input = readline()
        genofile = input
        if isfile(genofile)
            println("File found: ", input)
            println("(Press Enter to continue)")
            readline()  
            break 
        else
            println("Unable to locate file. Please try again.\n")
        end
    end
    println("(Press any key to continue)")
    readline()
    println("Continue with the rest of the program.")

    phenotypes = CSV.read(phenofile,DataFrame,delim = ',',header=true,missingstring=["NA"])
    pedigree   = get_pedigree(pedfile,separator=",",header=true);
    genotypes  = get_genotypes(genofile,separator=',',method="BayesC");



     # Step 3: Build Model Equations
    model_equation  ="y1 = intercept + x1 + x2 + x2*x3 + ID + dam + genotypes"
    model = build_model(model_equation);

        
    # Step 4: Set Factors or Covariates
    set_covariate(model,"x1");
        
    # Step 5: Set Random or Fixed Effects
    set_random(model,"x2");
    set_random(model,"ID dam",pedigree);
        
    # Step 6: Run Analysis
    out=runMCMC(model,phenotypes);
        
    # Step 7: Check Accuracy
    results   = innerjoin(out["EBV_y1"], phenotypes, on = :ID) 
    accuracy  = cor(results[!,:EBV],results[!,:bv1])
    println("Accuracy: ", accuracy)
end
    
