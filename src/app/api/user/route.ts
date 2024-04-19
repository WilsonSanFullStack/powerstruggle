import { NextResponse, NextRequest } from "next/server";
import prisma from "@/libs/prisma";

export async function POST(req: NextRequest) {
  try {
    const data = await req.json()
    const newUser = await prisma.user.create({
      data: {
        firstName: data.firstName,
        lastName: data.lastName,
        email: data.email,
        admin: true,
      },
    });
    return NextResponse.json(newUser);
  } catch (error) {
    console.log(error);
    return NextResponse.json({
      message: "no se pudo crear el usuario" + error,
    });
  }
}
