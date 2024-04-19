import RegisterUser from "./components/RegisterUser";
const colombia = {
  amazonas: "/amazonas.svg",
  caqueta: "/caqueta.svg",
};

export default function Home() {
  return (
    <main className="container flex justify-center items-center h-screen">
      <RegisterUser />
      <img src="/colombia.svg" alt="svg de colombia" />
      <img src="/colombia copy.svg" alt="svg de colombia" className="bg-red-500" />
      
        <img src={colombia.amazonas} alt="amazonas" />
        <img src={colombia.caqueta} alt="caqueta"/>
      
    </main>
  );
}
