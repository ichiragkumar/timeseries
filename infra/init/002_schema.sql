-- telemetry: API latency
CREATE TABLE IF NOT EXISTS api_latency (
  ts TIMESTAMPTZ NOT NULL,
  route TEXT NOT NULL,
  method TEXT NOT NULL,
  status_code INT NOT NULL,
  latency_ms INT NOT NULL,
  request_id TEXT NULL
);

SELECT create_hypertable('api_latency', 'ts', if_not_exists => TRUE);

CREATE INDEX IF NOT EXISTS api_latency_route_ts_idx
  ON api_latency (route, ts DESC);


-- telemetry: db query latency
CREATE TABLE IF NOT EXISTS db_query_latency (
  ts TIMESTAMPTZ NOT NULL,
  label TEXT NOT NULL,              -- e.g. "orders.list", "payments.update"
  latency_ms INT NOT NULL,
  rows_count INT NULL
);

SELECT create_hypertable('db_query_latency', 'ts', if_not_exists => TRUE);

CREATE INDEX IF NOT EXISTS db_query_latency_label_ts_idx
  ON db_query_latency (label, ts DESC);
