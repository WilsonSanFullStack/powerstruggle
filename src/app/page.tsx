import RegisterUser from "./components/RegisterUser";
import Svg from "./components/Svg";


export default function Home() {


  return (
    <main className="container flex justify-center items-center h-screen">
      <RegisterUser />
      {/* <img src="/colombia.svg" alt="svg de colombia" /> */}
      <Svg  />
      <img
        id="colombiaWilson"
        src="/colombiawilson2.svg"
        alt="svg de colombia"
      />
    </main>
  );
}
