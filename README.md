# MCMC Sampler (EXE)

This is an executable (EXE) file generated from the Julia source code provided in the `mcmc` module. The executable performs Markov Chain Monte Carlo (MCMC) sampling to estimate the mean and variance of a dataset.

## Usage

1. **Prerequisites**: Ensure you have the generated executable file (`MCMCSampler.exe`) in your preferred directory. Additionally, make sure you have a data file named `data.csv` in the same directory. You can adjust the file name as needed.

2. **Run the Executable**:

   - Open a terminal or command prompt.
   - Navigate to the directory containing the executable file (`MCMCSampler.exe`) and the `data.csv` file.

   - Run the executable using the following command:

     ```sh
     ./MCMCSampler.exe
     ```

3. **Execution**: The executable will perform the following steps:

   - Read the data from the `data.csv` file into a DataFrame.
   - Perform MCMC sampling to estimate the mean and variance of the data distribution.
   - Print the estimated mean and variance to the console.

## Source Code

The source code for this MCMC sampler can be found in the Julia module `mcmc` in my GitHub repository: [MCMC Sampler GitHub Repository](https://github.com/yourusername/mcmc).

## Customization

- If you have a different CSV data file with a different name, ensure it is in the same directory and update the code accordingly.

- You can customize the MCMC parameters and initial values in the source code to adapt the sampler to different datasets and requirements.

## Author

- Gu Gong

Feel free to modify this README to include additional information or customize it to your needs. This README is intended to help users understand how to use the generated executable file.

