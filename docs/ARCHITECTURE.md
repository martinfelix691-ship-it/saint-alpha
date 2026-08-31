# Saint Alpha Architecture

## Vision

Saint Alpha is a quantitative research laboratory for developing,
testing, improving and storing alpha ideas.

## Core Workflow

Economic Hypothesis
        ↓
Field Selection
        ↓
Alpha Generation
        ↓
Simulation
        ↓
Performance Analysis
        ↓
Correlation Screening
        ↓
Reduce Correlation (if needed)
        ↓
Re-simulate
        ↓
Approve
        ↓
Approved Alpha Vault

## Main Components

### 1. Field Library

Stores:

- Field name
- Dataset
- Category
- Description
- Coverage
- Region
- Availability

Users can:

- Add fields
- Upload field files
- Update fields
- Search fields
- Filter fields
- Organize fields by region

### 2. Alpha Generator

The research engine receives:

- Economic hypothesis
- Available fields
- Region
- Universe
- Research settings
- Existing approved alphas

It generates WorldQuant-compatible alpha candidates.

### 3. Simulator

The simulator evaluates candidates using available
historical data.

Important metrics:

- Sharpe
- Fitness
- Return
- Turnover
- Drawdown
- Out-of-sample performance

### 4. Correlation Guard

Every new candidate is compared with approved alphas.

Default maximum correlation:

0.70

The system checks:

- Formula structure
- Field overlap
- Architecture
- Economic mechanism
- Historical return correlation

### 5. Reduce Correlation

A highly correlated alpha is not automatically discarded.

The system can attempt controlled modifications.

Goal:

Reduce correlation while preserving alpha quality.

### 6. Approved Alpha Vault

Approved alphas are permanently stored.

Each alpha can contain:

- Formula
- Hypothesis
- Fields
- Architecture
- Region
- Settings
- Simulation results
- Correlation history
- Versions

Future alpha generation uses the vault to avoid unnecessary duplication.

### 7. Research Memory

Saint Alpha stores previous experiments so that the
research engine can learn what has already been tested.

### 8. WorldQuant Workflow

Saint Alpha generates the research formula and settings.

The official WorldQuant Brain simulation remains the
final validation source for Brain performance.

## Security

AI API keys and other secrets must never be placed inside:

- Flutter source code
- Android application
- GitHub repository

Secrets belong on a secure backend.

## Development Philosophy

Saint Alpha should favor:

- Research diversity
- Different economic hypotheses
- Different mathematical structures
- Controlled experimentation
- Low unnecessary correlation
- Robustness over curve fitting
