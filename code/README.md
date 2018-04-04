#  JuMP and Julia code for ISCO 2018 spring school

To follow along with the computational portion of the summer school, just follow these 7 simple steps!

## 1. Install Julia

You should use the latest version of Julia: v0.6.2.
Binaries of Julia for all platforms are available [here](http://julialang.org/downloads/).


## 2. Install basic JuMP packages

To install [JuMP](https://github.com/JuliaOpt/JuMP.jl) and the open-source LP/MIP solvers [Clp](https://projects.coin-or.org/Clp) and [Cbc](https://projects.coin-or.org/Cbc), launch Julia and run the following code:
```julia
Pkg.add("JuMP")
Pkg.add("Clp")
```
If you have a previous installation of Julia,
be sure to update your packages to the latest version by running ``Pkg.update()``.

To test that your installation is working, run the following code (the first time you run the code you may see the message like "INFO: Precompiling stale cache ..." for a few seconds):

```julia
using JuMP, Cbc
m = Model(solver=CbcSolver())
@variable(m, x >= 0, Int)
@variable(m, y >= 0)
@constraint(m, 2x + y <= 1)
@objective(m, Max, x+y)
status = solve(m)
@show status; @show getvalue(y);
```

The output should be:

```
status = :Optimal
getvalue(y) = 1.0
```

## 3. Install plotting package

For visualization we will use the [Plots](https://github.com/JuliaPlots/Plots.jl) package, which can be installed by running:
```julia
Pkg.add("Plots")
```

## 4. Install the PiecewiseLinearOpt package

One of our demonstrations will use advanced mixed integer programming (MIP) formulations for piecewise linear functions. These can be easily accessed through the [PiecewiseLinearOpt](https://github.com/joehuchette/PiecewiseLinearOpt.jl) package, which can be installed by running:
```julia
Pkg.add("PiecewiseLinearOpt")
```

## 5. Install the Polyhedra package

Another demonstration will use the package [Polyhedra](https://github.com/JuliaPolyhedra/Polyhedra.jl), which can be used for various polyhedral computationas (e.g. obtaining the extreme points of the feasible region of a linear programming JuMP model) by calling a library such as [CDD](https://www.inf.ethz.ch/personal/fukudak/cdd_home/). The Polyhedra package and the interface for CDD can be installed by running:
```julia
Pkg.add("Polyhedra")
Pkg.add("CDDLib")
```

NOTE: Package CDDLib downloads binaries for Windows and compiles CDDLib from sources for Linux and Mac. Install from sources just requires the presence of a C compiler and Linux additionally requires the GMP header files (see details in the [CDDLib.jl page](https://github.com/JuliaPolyhedra/CDDLib.jl)).

## 6. Install MICP solver Pajarito

We will also be using the entirely Julia-written mixed integer convex programming (MICP) solver [Pajarito](https://github.com/JuliaOpt/Pajarito.jl).

To install Pajarito run the following code:
```julia
Pkg.add("Pajarito")
```

## 7. Install IJulia and Jupyter

[Jupyter](http://jupyter.org) is a convenient notebook-based interface to present documents which interleave code, text, and equations. Example code will be available both in notebook and text-file format so Jupyter is not required for the demonstration.

To install Jupyter and the Julia backend [IJulia](https://github.com/JuliaLang/IJulia.jl) run the following code:
```julia
ENV["JUPYTER"]=""
Pkg.add("IJulia")
```

To start Jupyter run the following code:
```julia
using IJulia
notebook()
```

## OPTIONAL: Install a commercial MIP solver

We also recommend installing a commercial MIP solver, if one is available to you. The install instructions below assume you already have the corresponding binaries and license files installed in your system.

To make [CPLEX](https://www.ibm.com/analytics/data-science/prescriptive-analytics/cplex-optimizer) available to JuMP run the following code:
```julia
Pkg.add("CPLEX")
```

To make [Gurobi](http://www.gurobi.com) available to JuMP run the following code:
```julia
Pkg.add("Gurobi")
```

## More resources

We will not have the time to go through all of the basic syntax points of Julia. For more materials on learning Julia,
see [here](http://julialang.org/learning/).

In particular, a good updated introduction to Julia is [David Sanders'](http://sistemas.fciencias.unam.mx/~dsanders/) Julia v0.6 [tutorial](https://github.com/dpsanders/julia_towards_1.0).

The JuMP documentation is located [here](http://www.juliaopt.org/JuMP.jl/0.18/).
