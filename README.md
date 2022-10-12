# Test data for spectroscopic X-ray tools
All software programs need to be tested on some test data. Collecting and maintaining that data is a non-negligible effort. HEACIT contributes to software sustainability by providing a vetted set of test data that individual projects and developers can download and use with minimal effort.

## What is and is not in this repository
High-energy data comes in many forms: Event lists, spectra, lightcurves, images, etc. 
In practice, those different data formats often have different consumers, for example, spectra are read by [XSPEC](https://heasarc.gsfc.nasa.gov/xanadu/xspec/), [ISIS](https://space.mit.edu/cxc/isis/), [Sherpa](https://sherpa.readthedocs.io), [3ML](https://threeml.readthedocs.io/en/stable/), and others. Of course, there is some overlap ([cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/) or [astropy.io.fits](https://docs.astropy.org/en/stable/io/fits/index.html)) read any generic fits file), but most specialized programs concentrate on just one or a few of those formats.
Thus, it makes sense to collect test data for different formats independently, such that each program only has to download and read what is particularly relevant. 

*This repository collects X-ray spectroscopic data from real missions.*

## Organization of this repro
For each mission, we want one test dataset per “major configuration”. What is a major configuration? With that we mean that for missions like XMM, we want both an EPIC and an RGS spectrum, but do not need separate spectra for MOS1 and MOS2 or for “full frame” and “partial window” observations - the data files for spectra are so similar that testing one should be sufficient.
Of course, this is a judgment call to some degree and can evolve with time. 


In particular for spectra that are OGIP compliant, we expect this to be so rare that it will not balloon the size of the test data set to unacceptable levels.
## Data organization
Data is stored in a hierarchy two levels deep.

- README, licence etc.
- Mission1
  - Major-mode1 - Dataset1
    - PHA
    - RMF
    - ARF
    - Background PHA/RMF/ARF
    - description.md
  - Major-mode2 - Dataset1
    - PHA
    - RMF
    - ARF
    - Background PHA/RMF/ARF
    - description.md
- Mission2
  - Dataset1
    - PHA2
    - RMFs, ARFs, ...
    - description.md
  - Dataset2
    - ...

## What files are in each dataset?
### binary files
Each dataset contains a set of data that should be read together, typically PHA, ARF, and RMF. This can include more than one spectrum, for example in a PHA2 dataset with multiple spectral orders. 

*Be considerate of the trade-off between completeness and disk space.*

### description.md 
This is a human-readable description of the data. This helps developers to understand what tests with this file should look like (e.g. if we see only noise, did we screw up the data format or is the object just that faint?)
Sometimes the same data can be used to verify that a file can be read correctly, and that e.g. a spectral fit recovers the exponent of a powerlaw for different fitting algorithms, so a few words about the astrophysics of the spectrum are useful.

Example:

    Chandra/HETG spectrum for ObsID 5.
    This is an accreting T Tauri star; the spectrum is a thermal plasma with strong emission lines and an absorbing column density around 1e20/cm^2.

### Script to download / generate the test data 
Recommended, but not required. This could be e.g. a `wget` command to download the data or a series of ftools calls. 

*This can help to reproduce this or similar files if the datafiles ever need to be upgraded. Even if archived and APIs change, it can provide a documentation of what was done and a starting point for later upgrades.*

## Data storage
Data files can be relatively big (e.g. a typical Chandra/MEG RMF is almost 20 MB), but they should be updated rarely, so that is not a show-stopper for github. Data is collected here because it is easy to contribute via pull requests.

At fixed times we will tag a specific frozen version of the archive and deliver this to HEASARC, who can host this as a dataset.

