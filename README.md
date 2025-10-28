
# 🧠 Unsupervised Feature Selection using PCA and MOORA in bioinformatics and gene expression data

This repository provides the MATLAB implementation of an **unsupervised feature selection** method that combines **Principal Component Analysis (PCA)** with the **Multi-Objective Optimization on the basis of Ratio Analysis (MOORA)** technique.  
The method is particularly effective for high-dimensional datasets in **bioinformatics**, **text classification**, and **image analysis**.

---

## 🔖 Published Paper

If you use this code in your research, please cite the published paper:

> **M. Habibollahi, A. Hashemi, M. B. Dowlatshahi, M. Kuchaki Rafsanjani, V. Arya, B. B. Gupta.**  
> *How PCA helps multi‑criteria decision making for feature selection: A feature fusion approach in bioinformatics and gene expression data.*  
> Alexandria Engineering Journal, Vol. 130, 2025, pp. 809–826.  
> DOI: [10.1016/j.aej.2025.09.028](https://doi.org/10.1016/j.aej.2025.09.028)

---

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

---

## 🚀 How to Run

1. Install MATLAB.
2. Clone this repository and navigate to the folder.
3. Place your dataset as `colon.csv` under `data/`, or change the path in `main.m`.
4. Run the script:

```matlab
main
```

---

## 🧩 Method Overview

### 1️⃣ PCA Phase
- Standardize the dataset to zero mean and unit variance.
- Perform PCA to compute eigenvectors and eigenvalues of the covariance matrix.
- Select the top `k` principal components capturing the majority of data variance.
- For each feature, compute its **reconstruction error** across these components — features poorly reconstructed by dominant components often contain unique information.

### 2️⃣ Decision Matrix Construction
- Construct a **decision matrix** where each row corresponds to a feature and each column to a PCA-based criterion (e.g., reconstruction error per component).
- Assign weights to criteria based on normalized PCA eigenvalues:
  \( w_i = \lambda_i / \sum \lambda_i \)

### 3️⃣ MOORA Ranking
- Normalize the decision matrix.
- Multiply each criterion by its corresponding weight.
- Define beneficial and non-beneficial criteria.
- Compute for each feature:
  \( y_j = \sum (w_i x_{ij}^{+}) - \sum (w_i x_{ij}^{-}) \)
- Rank features by descending \( y_j \) values.

### 4️⃣ Feature Selection
- The top-ranked features are selected as the most informative subset for downstream analysis (e.g., clustering or classification).

---

## ⚙️ Theoretical Insight

| Aspect | PCA Contribution | MOORA Contribution |
|--------|------------------|--------------------|
| **Goal** | Extract dominant data structure | Rank features using multiple criteria |
| **Nature** | Linear transformation | Decision-making / ranking |
| **Output** | Principal components & reconstruction errors | Weighted ranking of original features |
| **Synergy** | PCA defines structural metrics; MOORA integrates them into a multi-objective decision process |

This hybrid method combines **variance-based structure learning** (PCA) with **multi-criteria decision making** (MOORA) to create a more interpretable and effective unsupervised feature selection framework.

---

## 📈 Example Output

```
Top ranked features (by index):
    13    5    17   ...
```

---

## 📚 References

1. Habibollahi, M., Hashemi, A., Dowlatshahi, M. B., Kuchaki Rafsanjani, M., Arya, V., & Gupta, B. B. (2025).  
   *How PCA helps multi‑criteria decision making for feature selection: A feature fusion approach in bioinformatics and gene expression data.*  
   *Alexandria Engineering Journal*, 130, 809–826. [https://doi.org/10.1016/j.aej.2025.09.028](https://doi.org/10.1016/j.aej.2025.09.028)

---

## 🧮 Future Work

- Incorporate feature redundancy metrics (e.g., correlation-based penalties).  
- Experiment with adaptive weighting (entropy or CRITIC methods).  
- Replace PCA with nonlinear alternatives such as Autoencoders or Kernel PCA, while retaining MOORA ranking.

---

## 🧑‍💻 Author & Contact

This repository is maintained by **M. Habibollahi**.  
For questions or collaborations, please reach out via the contact information provided in the paper.

---
