import "./App.css";
import { Route, Routes } from "react-router-dom";
import Home from "./pages/Home";
import Categories from "./pages/Categories";
import Notes from "./pages/Notes";
import ProtectedRoute from "./utils/ProtectedRoute";
import Archives from "./pages/Archives";

function App() {
  return (
    <>
      <Routes>
        <Route exact path="/" element={<Home />} />
        <Route element={<ProtectedRoute />}>
          <Route exact path="/categories" element={<Categories />} />
          <Route exact path="/notes" element={<Notes />} />
          <Route exact path="/archives" element={<Archives />} />
        </Route>
        {/* <Route path="*" element={<NotFound />} /> */}
      </Routes>
    </>
  );
}

export default App;
