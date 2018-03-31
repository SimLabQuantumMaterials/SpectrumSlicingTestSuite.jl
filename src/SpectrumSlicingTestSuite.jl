module SpectrumSlicingTestSuite

export convergenceRatio,testIntervals

import Polynomials
import GaussQuadrature

include("./chebyshevpoly.jl")
include("./kpm.jl")
include("./phi.jl")
include("./kpmdos.jl")
include("./endPoints.jl")
include("./testIntervals.jl")
include("./convergenceratio.jl")

end # module
