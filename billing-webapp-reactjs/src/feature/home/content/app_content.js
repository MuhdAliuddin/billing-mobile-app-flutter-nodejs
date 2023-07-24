import React, { Suspense } from "react";
import { Navigate, Route, Routes } from "react-router-dom";

// routes config
import routes from "./routes";

const AppContent = () => {
  return (
    <div>
      <Suspense>
        <Routes>
          {routes.map((route, idx) => {
            return (
              route.element && (
                <Route
                  key={idx}
                  path={route.path}
                  exact={route.exact}
                  name={route.name}
                  element={<route.element />}
                />
              )
            );
          })}
          <Route path="/" element={<Navigate to="dashboard" replace />} />
          <Route path="*" element={<Navigate to="/404" replace />} />
        </Routes>
      </Suspense>
    </div>
  );
};

export default React.memo(AppContent);
