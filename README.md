# TD-IEEPST
open source codes of paper:《A Point-Set Topology Based Information Entropy Estimation Method for Hyperspectral Target Detection》

DOI: 10.1109/TGRS.2024.3400321

# Abstract
With hyperspectral remote sensors (imaging spectrometers) imaging a scene, the specificity of the target of interest is manifested in the significant differences between it and the surrounding background in terms of quantity, spatial distribution, and spectral characteristics, which provides conditions for the implementation of pixel-level diagnostics for target detection. Traditional model-driven methods utilize specific model assumptions to parse hyperspectral image (HSI) data in scenes with variability, and are prone to encounter limitations due to model-data discrepancy. Most data-driven methods are limited in practical applications due to the great demand of training samples, the large number of parameters to be determined, and the costly computational complexity. To address the limitations of the existing methods, this paper adopts point-set topology theories to analyze the properties of hyperspectral data at the mathematical-statistical level and seek a solution for the information retrieval task of target detection, whereby a target detection method through information entropy estimation based on point-set topology (TD-IEEPST) is proposed. Firstly, parallel topological spaces are constructed to order the original HSI data to ensure that the differences in data features between various classes of land covers are reflected in intuitive properties in the topological spaces. Secondly, in conjunction with the priori information about the target, information entropy estimation is introduced to select optimal separable spaces for the target and the background by measuring the degree of ordering of data to achieve an accurate separation. Finally, a proper way to quantify and highlight the differences in data features between various land covers in the optimal separable spaces is explored for the algorithmic output to perform the information retrieval task. The proposed TD-IEEPST exploits an innovative combination of point set topology theories and information entropy estimation to achieve efficient extraction of land cover information for detection, ensuring both theoretical interpretability and computational efficiency. Extensive experimental results on real hyperspectral data sets verify that the proposed method is ahead of other widely used and state-of-the-art methods in terms of computational cost, detection effects, and robustness, promising to provide technical supports for detection response requirements in practical applications.
# Index Terms
Hyperspectral image, target detection, information entropy, topology, machine learning.
# Flowchart
![Flowchart](https://github.com/sxt1996/TD-IEEPST/assets/55687887/a8155ca8-3ee2-4a85-b08a-39739e2a8e3b)
# Data Set
AVIRIS-1: The AVIRIS-1 data set was acquired with the Airborne Visible/Infrared Imaging Spectrometer (AVIRIS). There are 100×100 pixels of an area in San Diego being collected. The spatial resolution is 3.5 m. And the spectrum spans a wavelength range of 370-2510nm, from which 224 spectral channels are collected. After removing the absorbing and low signal-to-noise ratio (SNR) portions, 189 bands are retained. The objects of interest are three airplanes in three positions, occupying 20, 22, and 22 pixels respectively.
# Guidelines
1. Install R2014a or higher versions of MATLAB.
2. Download this code package.
3. Set path.
4. Don't worry about importing data or anything else, just run Main.m.
# Contact
If you have any questions, please feel free to contact me.
sxt1996@outlook.com
