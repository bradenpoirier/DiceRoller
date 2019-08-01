// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

using System;
using Microsoft.Quantum.Simulation.Simulators;
using Microsoft.Quantum.Simulation.Core;

namespace Microsoft.Quantum.Samples.DiceRoller
{
    /// <summary>
    /// This is a Console program that runs Shor's algorithm 
    /// on a Quantum Simulator.
    /// </summary>
    class Program
    {
        // The console application takes up to three arguments
        // 1. numberToFactor -- number to be factored 
        // 2. nTrials -- number of trial to perform 
        // 3. useRobustPhaseEstimation -- if true uses Robust Phase Estimation, 
        //                                uses Quantum Phase Estimation otherwise.
        // If you build the Debug configuration, the executable will be located in 
        // Libraries\Samples\IntegerFactorization\bin\Debug\ folder;
        // for the Release configuration the folder is 
        // Libraries\Samples\IntegerFactorization\bin\Release.
        // The name of the executable is IntegerFactorization.exe.
        static void Main(string[] args)
        {
            using (QuantumSimulator sim = new QuantumSimulator()){
                        // Roll the dice on the quantum simulator
                        long number  = Roll.Run(sim).Result;
                        Console.WriteLine($"Dice Rolled: {number}");
            }
        }
    }
}