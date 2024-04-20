-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "nextLevel" INTEGER NOT NULL,
    "experience" DECIMAL(65,30) NOT NULL,
    "job" INTEGER NOT NULL,
    "war" INTEGER NOT NULL,
    "store" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "admin" BOOLEAN NOT NULL,
    "ipAddress" TEXT NOT NULL,
    "userStoreId" TEXT NOT NULL,
    "partyId" TEXT NOT NULL,
    "factionId" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserStore" (
    "id" TEXT NOT NULL,
    "gold" INTEGER NOT NULL,
    "copper" INTEGER NOT NULL,
    "carbon" INTEGER NOT NULL,
    "emerald" INTEGER NOT NULL,
    "iron" INTEGER NOT NULL,
    "nickel" INTEGER NOT NULL,
    "silver" INTEGER NOT NULL,
    "platinum" INTEGER NOT NULL,
    "army" INTEGER NOT NULL,
    "armada" INTEGER NOT NULL,
    "airForce" INTEGER NOT NULL,

    CONSTRAINT "UserStore_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Factory" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "producedMaterial" TEXT NOT NULL,
    "requiredGold" INTEGER NOT NULL,
    "requiredCopper" INTEGER NOT NULL,
    "requiredCarbon" INTEGER NOT NULL,
    "requiredEmerald" INTEGER NOT NULL,
    "requiredIron" INTEGER NOT NULL,
    "requiredNickel" INTEGER NOT NULL,
    "requiredSilver" INTEGER NOT NULL,
    "requiredPlatinum" INTEGER NOT NULL,
    "productionTime" INTEGER NOT NULL,
    "requiredLevel" INTEGER NOT NULL,
    "constructionCost" INTEGER NOT NULL,
    "productionRate" INTEGER NOT NULL,
    "createdBy" TEXT NOT NULL,
    "departamentId" TEXT NOT NULL,

    CONSTRAINT "Factory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Departament" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "gold" INTEGER NOT NULL DEFAULT 0,
    "copper" INTEGER NOT NULL DEFAULT 0,
    "carbon" INTEGER NOT NULL DEFAULT 0,
    "emerald" INTEGER NOT NULL DEFAULT 0,
    "iron" INTEGER NOT NULL DEFAULT 0,
    "nickel" INTEGER NOT NULL DEFAULT 0,
    "silver" INTEGER NOT NULL DEFAULT 0,
    "platinum" INTEGER NOT NULL DEFAULT 0,
    "defense" INTEGER NOT NULL DEFAULT 1,
    "attack" INTEGER NOT NULL DEFAULT 1,
    "health" INTEGER NOT NULL DEFAULT 1,
    "education" INTEGER NOT NULL DEFAULT 1,
    "progress" INTEGER NOT NULL DEFAULT 1,
    "maxGold" INTEGER NOT NULL DEFAULT 1,
    "maxCopper" INTEGER NOT NULL DEFAULT 1,
    "maxCarbon" INTEGER NOT NULL DEFAULT 1,
    "maxEmerald" INTEGER NOT NULL DEFAULT 1,
    "maxIron" INTEGER NOT NULL DEFAULT 1,
    "maxNickel" INTEGER NOT NULL DEFAULT 1,
    "maxSilver" INTEGER NOT NULL DEFAULT 1,
    "maxPlatinum" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "Departament_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Region" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "capital" TEXT NOT NULL,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Party" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "ideology" TEXT NOT NULL,
    "departmentId" TEXT NOT NULL,

    CONSTRAINT "Party_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Faction" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "departmentId" TEXT NOT NULL,

    CONSTRAINT "Faction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_RegionDepartments" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Region_capital_key" ON "Region"("capital");

-- CreateIndex
CREATE UNIQUE INDEX "_RegionDepartments_AB_unique" ON "_RegionDepartments"("A", "B");

-- CreateIndex
CREATE INDEX "_RegionDepartments_B_index" ON "_RegionDepartments"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userStoreId_fkey" FOREIGN KEY ("userStoreId") REFERENCES "UserStore"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_partyId_fkey" FOREIGN KEY ("partyId") REFERENCES "Party"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_factionId_fkey" FOREIGN KEY ("factionId") REFERENCES "Faction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Factory" ADD CONSTRAINT "Factory_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Factory" ADD CONSTRAINT "Factory_departamentId_fkey" FOREIGN KEY ("departamentId") REFERENCES "Departament"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Region" ADD CONSTRAINT "Region_capital_fkey" FOREIGN KEY ("capital") REFERENCES "Departament"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Party" ADD CONSTRAINT "Party_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Departament"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Faction" ADD CONSTRAINT "Faction_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Departament"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RegionDepartments" ADD CONSTRAINT "_RegionDepartments_A_fkey" FOREIGN KEY ("A") REFERENCES "Departament"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RegionDepartments" ADD CONSTRAINT "_RegionDepartments_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;
