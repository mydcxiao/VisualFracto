# VisualFracto

The official MATLAB implementation of visual analysis for silicate glass fractography, which 
is from the Journal of Materials Engineering and Performance paper "Automated Quantitative Fractography of Silicate Glasses with Visual Analysis". 
The paper first introduces and tests a visual analysis algorithm to carry out the fractographic analysis of silicate glasses automatically and objectively. 
The fracture surfaces of various silicate glasses produced by both tensile and flexural stress fields were considered. 
First, optical images of the fracture surfaces were gathered and unique; 
descriptive features such as the shape of the ‘mirror-mist boundary’ were extracted using visual analysis tools. 
Next, a newly developed algorithm compared the processed images with a database comprised of fracture samples of 
known strengths, fracture toughness, stress fields, and geometric features. 
Lastly, dimensional analysis principles coupled with a broad, experimental set of over 2100 fracture surfaces was used to 
accurately estimate the strengths of the imaged fracture surfaces.

## FlowChart

<p align="center">
  <img src="flowchart.png" width="800">
</p>

## Preparation

1. Environment
   - [MATLAB R2020a](https://www.mathworks.com/products/new_products/release2020a.html)
   - MATLAB GUIDE v2.5(Noted that GUIDE will be removed in the future. See also [Release Notes](https://www.mathworks.com/help/doc-archives.html))
2. Datasets
   - Self-collected image dataset via a standard inverted compound microscope (SOPTOP ICX41M) in dark- and bright-field illumination. The model of the digital camera model used was E3ISPM; the exposure time for all images was held constant at 350 ms for all images, whereas the light source was manually tuned between 1000 and 2000 lumens.
   - For original dataset, please contact authors in [Automated Quantitative Fractography of Silicate Glasses with Visual Analysis](https://link.springer.com/article/10.1007/s11665-021-05697-1).

## How to Use

Refer to instructions in [Guide](./Guide.pdf).

## Results

Refer to [Automated Quantitative Fractography of Silicate Glasses with Visual Analysis](https://link.springer.com/article/10.1007/s11665-021-05697-1).

## Citing
If you find this useful, please cite it.

```
@article{xiao2021automated,
  title={Automated Quantitative Fractography of Silicate Glasses with Visual Analysis},
  author={Xiao, Yuhang and Dugnani, Roberto},
  journal={Journal of Materials Engineering and Performance},
  volume={30},
  pages={3612--3623},
  year={2021},
  publisher={Springer}
}
```
