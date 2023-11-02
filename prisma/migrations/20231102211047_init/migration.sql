/*
  Warnings:

  - You are about to drop the `Deatil` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Deatil" DROP CONSTRAINT "Deatil_infoId_fkey";

-- DropTable
DROP TABLE "Deatil";

-- CreateTable
CREATE TABLE "Datil" (
    "idDetail" TEXT NOT NULL,
    "infoId" VARCHAR(45) NOT NULL,
    "nameDetail" VARCHAR(50) NOT NULL,
    "url" VARCHAR(250),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Datil_pkey" PRIMARY KEY ("idDetail")
);

-- CreateIndex
CREATE UNIQUE INDEX "Datil_idDetail_key" ON "Datil"("idDetail");

-- CreateIndex
CREATE INDEX "Datil_infoId_idx" ON "Datil"("infoId");

-- AddForeignKey
ALTER TABLE "Datil" ADD CONSTRAINT "Datil_infoId_fkey" FOREIGN KEY ("infoId") REFERENCES "Info"("idInfo") ON DELETE RESTRICT ON UPDATE CASCADE;
