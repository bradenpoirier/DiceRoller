// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

using System;
using Microsoft.Quantum.Simulation.Simulators;
using Microsoft.Quantum.Simulation.Core;

namespace Microsoft.Quantum.Samples.DiceRoller
{
    /// <summary>
    /// This is a Console program that runs a random number generator
    /// on a Quantum Simulator.
    /// </summary>
    class Program
    {
        // The console application takes zero arguments
        // If you build the Debug configuration, the executable will be located in 
        // Libraries\Samples\DiceRoller\bin\Debug\ folder;
        // for the Release configuration the folder is 
        // Libraries\Samples\DiceRoller\bin\Release.
        // The name of the executable is DiceRoller.exe.
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