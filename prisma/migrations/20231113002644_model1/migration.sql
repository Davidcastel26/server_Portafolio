-- CreateTable
CREATE TABLE "User" (
    "idUser" TEXT NOT NULL,
    "userName" VARCHAR(25) NOT NULL,
    "email" VARCHAR(45) NOT NULL,
    "name" VARCHAR(10) NOT NULL,
    "lastName" VARCHAR(10),
    "mainDesc" VARCHAR(200) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("idUser")
);

-- CreateTable
CREATE TABLE "TagsByUser" (
    "idTag" TEXT NOT NULL,
    "userId" VARCHAR(45) NOT NULL,
    "tagName" VARCHAR(20) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TagsByUser_pkey" PRIMARY KEY ("idTag")
);

-- CreateTable
CREATE TABLE "about" (
    "idAbout" TEXT NOT NULL,
    "userId" VARCHAR(45) NOT NULL,
    "aboutDesc" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "about_pkey" PRIMARY KEY ("idAbout")
);

-- CreateTable
CREATE TABLE "Info" (
    "idInfo" TEXT NOT NULL,
    "name" VARCHAR(30) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Info_pkey" PRIMARY KEY ("idInfo")
);

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

-- CreateTable
CREATE TABLE "Project" (
    "idProjects" TEXT NOT NULL,
    "userId" VARCHAR(45) NOT NULL,
    "projectName" VARCHAR(100) NOT NULL,
    "urlWeb" VARCHAR(250) NOT NULL,
    "urlGit" VARCHAR(250) NOT NULL,
    "desc" VARCHAR(500) NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("idProjects")
);

-- CreateTable
CREATE TABLE "ProjectTags" (
    "idTags" TEXT NOT NULL,
    "projectId" VARCHAR(45) NOT NULL,
    "tagName" VARCHAR(20) NOT NULL,

    CONSTRAINT "ProjectTags_pkey" PRIMARY KEY ("idTags")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_idUser_key" ON "User"("idUser");

-- CreateIndex
CREATE UNIQUE INDEX "User_userName_key" ON "User"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_lastName_key" ON "User"("lastName");

-- CreateIndex
CREATE UNIQUE INDEX "TagsByUser_idTag_key" ON "TagsByUser"("idTag");

-- CreateIndex
CREATE INDEX "TagsByUser_userId_idx" ON "TagsByUser"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "about_idAbout_key" ON "about"("idAbout");

-- CreateIndex
CREATE INDEX "about_userId_idx" ON "about"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Info_idInfo_key" ON "Info"("idInfo");

-- CreateIndex
CREATE UNIQUE INDEX "Info_name_key" ON "Info"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Datil_idDetail_key" ON "Datil"("idDetail");

-- CreateIndex
CREATE INDEX "Datil_infoId_idx" ON "Datil"("infoId");

-- CreateIndex
CREATE UNIQUE INDEX "Project_idProjects_key" ON "Project"("idProjects");

-- CreateIndex
CREATE UNIQUE INDEX "Project_projectName_key" ON "Project"("projectName");

-- CreateIndex
CREATE INDEX "Project_userId_idx" ON "Project"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ProjectTags_idTags_key" ON "ProjectTags"("idTags");

-- AddForeignKey
ALTER TABLE "TagsByUser" ADD CONSTRAINT "TagsByUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("idUser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "about" ADD CONSTRAINT "about_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("idUser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Datil" ADD CONSTRAINT "Datil_infoId_fkey" FOREIGN KEY ("infoId") REFERENCES "Info"("idInfo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("idUser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectTags" ADD CONSTRAINT "ProjectTags_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("idProjects") ON DELETE RESTRICT ON UPDATE CASCADE;
