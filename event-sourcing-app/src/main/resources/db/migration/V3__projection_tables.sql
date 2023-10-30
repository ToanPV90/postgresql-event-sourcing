CREATE TABLE IF NOT EXISTS RM_ORDER (
  ID              UUID                      PRIMARY KEY,
  VERSION         INTEGER                   NOT NULL,
  STATUS          TEXT                      NOT NULL,
  RIDER_ID        UUID                      NOT NULL,
  PRICE           DECIMAL(19, 2)            NOT NULL,
  DRIVER_ID       UUID,
  PLACED_DATE     TIMESTAMP WITH TIME ZONE  NOT NULL,
  ACCEPTED_DATE   TIMESTAMP WITH TIME ZONE,
  CANCELLED_DATE  TIMESTAMP WITH TIME ZONE,
  COMPLETED_DATE  TIMESTAMP WITH TIME ZONE
);

CREATE TABLE IF NOT EXISTS RM_ORDER_ROUTE (
  ORDER_ID   UUID              NOT NULL REFERENCES RM_ORDER (ID),
  ADDRESS    TEXT,
  LATITUDE   DOUBLE PRECISION  NOT NULL,
  LONGITUDE  DOUBLE PRECISION  NOT NULL,
  PRIMARY KEY (ORDER_ID, ADDRESS)
);

CREATE INDEX IF NOT EXISTS IDX_RM_ORDER_ROUTE_ORDER_ID ON RM_ORDER_ROUTE (ORDER_ID);