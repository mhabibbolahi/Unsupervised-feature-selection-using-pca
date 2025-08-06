# Unsupervised Feature Selection using PCA and MOORA

This repository provides the MATLAB implementation of an unsupervised feature selection method that combines **Principal Component Analysis (PCA)** with the **Multi-Objective Optimization on the basis of Ratio Analysis (MOORA)** technique. The proposed method is especially suited for high-dimensional datasets such as those in **bioinformatics**, **text classification**, and **image analysis**.

## 🔬 Abstract

In high-dimensional data analysis, unsupervised feature selection plays a crucial role in enhancing model interpretability and reducing computational cost. While Principal Component Analysis (PCA) and Multi-Criteria Decision-Making (MCDM) methods such as MOORA have individually been employed for dimensionality reduction and feature evaluation, their combined use remains underexplored in the context of unsupervised feature selection. This study proposes a structured hybrid approach that integrates PCA for extracting dominant components and MOORA for ranking original features based on their alignment with those components. Unlike traditional methods that rely on a single criterion or lack interpretability, our fusion method incorporates multiple decision metrics in a unified framework. The proposed approach is evaluated on both bioinformatics datasets and diverse real-world applications, demonstrating consistent improvements in classification accuracy and feature reduction compared to standalone PCA, MOORA, and other baseline techniques. These results suggest that the synergy between PCA and MCDM can provide a more robust and generalizable strategy for unsupervised feature selection across domains.

## 📁 Repository Structure

```
PCA-MOORA-FeatureSelection/
├── data/
│   └── colon.csv              # Sample dataset (replace with your own)
├── functions/
│   ├── performPCA.m           # Custom PCA function
│   └── moora.m                # MOORA-based ranking function
├── main.m                     # Main script to run feature selection
└── README.md                  # This file
```

## 🚀 How to Run

1. Make sure MATLAB is installed.
2. Clone this repository and navigate to the folder.
3. Place your dataset as `colon.csv` under `data/`, or change the path in `main.m`.
4. Run the script:

```matlab
main
```

## 🧠 Method Overview

- **PCA** is used to compute the reconstruction error for each original feature across successive eigenvectors.
- The reconstruction error vectors are combined to build a **decision matrix**.
- **MOORA** ranks the features by evaluating this matrix using a weighted scoring approach, where weights are based on PCA eigenvalues.
- The top-ranked features are selected as the most informative.

## 📈 Output

The output of the method is a sorted list of feature indices based on their importance:

```
Top ranked features (by index):
    13    5    17   ...
```

## 📚 Citation

If you use this code in your research, please cite the corresponding paper (TBA).