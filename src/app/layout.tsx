import type { Metadata } from "next";
import { Teko } from "next/font/google";
import "./globals.css";
import Link from "next/link";

const font = Teko({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Power Struggle",
  description: "Es un juego de guerra entre paises y guerra internas",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${font.className} antialiased bg-personal`}>
        <nav className="px-10 bg-slate-500 fixed top-0 min-w-full font-bold">
          <ul className="flex list-none justify-between items-center h-9">
            <li className="inline-block items-center">
              <Link href="/">Home</Link>
            </li>
            <li className="inline-block items-center">
              <Link href="/">Profile</Link>
            </li>
            {/* <li className="inline-block items-center">
              <Link href="/image">Image</Link>
            </li> */}
          </ul>
        </nav>
        {children}
      </body>
    </html>
  );
}
