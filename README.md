# Research-about-numerical-methods-of-Special-Relativistic-Hydrodynamics
Scientific Research with prof Kailiang Wu

This minor project was initiated by Professor Wu following his seminar on the numerical simulation aspects of special relativistic hydrodynamics (RHD). He extracted a segment from his previous research for us to validate, thereby deepening our understanding of the subject matter. This opportunity also allowed us to conduct an in-depth exploration of related issues.

Professor Wu has developed a high-order accurate, Physics-Constrained Preserving (PCP) central discontinuous Galerkin (DG) method for solving one-dimensional and two-dimensional special relativistic hydrodynamics equations with a general equation of state (EOS). 

For the pdf document named research questions, we mainly focus on admissible state set of the RHD equation by these problems. And these questions are actually some properties of the set given above. We are required to utilize computer to observe and check. 
Further offer the rigorous proof. The first inequality to be proven is related to the physical constraints of the RHD equations. This underscores the importance of maintaining positive values for density, pressure, and specific internal energy. 
Problem 2 explores the nonlinear equations related to the preservation of physical constraints in the numerical solutions of the RHD equations, involving the relationship between the conserved quantities and state variables in the RHD equations. 
Problem 3 requires conjecturing and proving whether the given equation holds. This is related to the conservation properties of the RHD equations and the equation of state, as well as the relationships between density, energy, and pressure. 
Problem 4 requires proving that for the given dependent variables, there exists a unique set of independent variables that satisfy the given relationship. This is related to the existence and uniqueness of solutions to the RHD equations, involving the mathematical structure and properties of the solutions to the RHD equations.

For the pdf document named high_dimension_properties, we still try to deal with the properties of admissible state set, which is regarded as opening the window of developing the positivity-preserving scheme with strictly and completely theoretical proof for the (non-relativistic) ideal compressible MHD.

The matlab code is my process to attempt to prove the above properties.
project.m and high_dimension.m correspond to the above problem respectively.
