CREATE TABLE regions (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE fields (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    dataset TEXT,
    category TEXT,
    description TEXT,
    coverage REAL,
    status TEXT DEFAULT 'available'
);

CREATE TABLE field_regions (
    field_id TEXT REFERENCES fields(id),
    region_id TEXT REFERENCES regions(id),
    PRIMARY KEY(field_id, region_id)
);

CREATE TABLE settings_profiles (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    region_id TEXT REFERENCES regions(id),
    universe TEXT,
    delay INTEGER,
    decay INTEGER,
    neutralization TEXT,
    truncation REAL,
    pasteurization BOOLEAN,
    nan_handling BOOLEAN
);

CREATE TABLE research_projects (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    hypothesis TEXT NOT NULL,
    settings_profile_id TEXT REFERENCES settings_profiles(id),
    target_sharpe REAL,
    target_fitness REAL,
    max_turnover REAL,
    max_correlation REAL
);

CREATE TABLE alphas (
    id TEXT PRIMARY KEY,
    project_id TEXT REFERENCES research_projects(id),
    status TEXT NOT NULL,
    current_version INTEGER DEFAULT 1
);

CREATE TABLE alpha_versions (
    alpha_id TEXT REFERENCES alphas(id),
    version INTEGER,
    formula TEXT NOT NULL,
    architecture TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(alpha_id, version)
);

CREATE TABLE simulations (
    id TEXT PRIMARY KEY,
    alpha_id TEXT REFERENCES alphas(id),
    version INTEGER,
    sharpe REAL,
    fitness REAL,
    annual_return REAL,
    turnover REAL,
    max_drawdown REAL,
    oos_sharpe REAL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE correlation_checks (
    id TEXT PRIMARY KEY,
    candidate_alpha_id TEXT REFERENCES alphas(id),
    reference_alpha_id TEXT REFERENCES alphas(id),
    correlation REAL,
    decision TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
