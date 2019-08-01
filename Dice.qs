// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
namespace Microsoft.Quantum.Samples.DiceRoller {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Oracles;
    open Microsoft.Quantum.Characterization;
    open Microsoft.Quantum.Diagnostics;

    ///////////////////////////////////////////////////////////////////////////////////////////////
    // Introduction ///////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////

    // This sample contains Q# code implementing a random number generator. 
    // The underlying implementation makes use of measuring qubits when they
    // are in a superposition state. When doing so, their state immediately 
    // collapses into one of the classical states (0 or a 1) with equal probability.
    // The probability is equal because we have applied the Hadamard operation to them.

    /// # Summary
    /// Generates a random integer between 1 and 8 given
    ///
    /// # Output
    /// An integer between 1 and 8.
    operation Roll () : (Int) {

        using (qubits = Qubit[3]) {
            // We apply a Hadamard operation H to the three qubits, 
            // which puts them into a superposition state with 50% probability of collapsing into a 0 or one upon measurement.
            H(qubits[0]); 
            H(qubits[1]); 
            H(qubits[2]); 
            
            // We then measure the three qubits, collapsing them into either a 0 or a 1.
            let bitZero = M(qubits[0]);
            let bitOne = M(qubits[1]);
            let bitTwo = M(qubits[2]);

            // Now we generate a number between 0 and 7 (inclusive) by using these three bits.
            // We actually add this result to 1 so that we get a number between 1 and 8.
            mutable diceValue = 1;

            // Recall: To convert a number from binary to decimal, we apply the following operation:
            // If the 0th bit is a 1, add 2^0=1 to the result. If it is a 0, add nothing.
            // If the 1st bit is a 1, add 2^1=2 to the result. If it is a 0, add nothing.
            // If the 2nd bit is a 1, add 2^2=4 to the result. If it is a 0, add nothing.

            // Target machines expect that qubits are in the "0" state immediately before deallocation, 
            // so that they can be reused and offered to other  using blocks for allocation.
            // See https://stackoverflow.com/questions/51387285/getting-error-released-qubits-are-not-in-zero-state-in-q-quantum-dev-kit
            // This is why we apply the X(qubits[n]) operation.

            // We could have applied RESET(qubits[0]) instead of M(qubits[0]) and we wouldn't have had to call X(qubits[n])
            // to flip the bits back to a zero whenever they are set to a one.


            if(bitZero == One){
                set diceValue +=1;
                X(qubits[0]);
            }

            if(bitOne == One){
                set diceValue +=2;
                X(qubits[1]);
            }

            if(bitTwo == One){
                set diceValue +=4;
                X(qubits[2]);
            }

            return diceValue; 
        }

    }

}

