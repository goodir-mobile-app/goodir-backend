-- CreateTable
CREATE TABLE "user" (
    "userId" SERIAL NOT NULL,
    "userName" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "category" (
    "cateId" SERIAL NOT NULL,
    "namelangouge" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "creatAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("cateId")
);

-- CreateTable
CREATE TABLE "categoryLevel" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "creatAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "cateId" INTEGER,
    "userUserId" INTEGER,

    CONSTRAINT "categoryLevel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course" (
    "couserId" SERIAL NOT NULL,
    "titleCourse" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "leval" TEXT NOT NULL,
    "images" TEXT NOT NULL,
    "videos" TEXT,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "userUserId" INTEGER NOT NULL,
    "levelId" INTEGER NOT NULL,

    CONSTRAINT "course_pkey" PRIMARY KEY ("couserId")
);

-- CreateTable
CREATE TABLE "chapter" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "dicription" TEXT NOT NULL,
    "creatAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "chapterVedios" TEXT NOT NULL,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "courseCouserId" INTEGER NOT NULL,
    "userUserId" INTEGER,

    CONSTRAINT "chapter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contacts" (
    "contactId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "userUserId" INTEGER,

    CONSTRAINT "contacts_pkey" PRIMARY KEY ("contactId")
);

-- CreateTable
CREATE TABLE "GroupCall" (
    "id" SERIAL NOT NULL,
    "creatorId" INTEGER NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3),
    "status" TEXT NOT NULL,

    CONSTRAINT "GroupCall_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Participant" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "callId" INTEGER NOT NULL,
    "joinTime" TIMESTAMP(3) NOT NULL,
    "leaveTime" TIMESTAMP(3),

    CONSTRAINT "Participant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "readingGemes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "isSuccess" BOOLEAN NOT NULL DEFAULT false,
    "isWrong" BOOLEAN NOT NULL DEFAULT false,
    "gameAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "score" INTEGER NOT NULL DEFAULT 0,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "readingGemes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "correctImg" (
    "id" SERIAL NOT NULL,
    "image" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "readingGemesId" INTEGER NOT NULL,

    CONSTRAINT "correctImg_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wrongImg" (
    "id" SERIAL NOT NULL,
    "image1" TEXT NOT NULL,
    "image2" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "readingGemesId" INTEGER NOT NULL,

    CONSTRAINT "wrongImg_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_phone_key" ON "user"("phone");

-- AddForeignKey
ALTER TABLE "category" ADD CONSTRAINT "category_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categoryLevel" ADD CONSTRAINT "categoryLevel_cateId_fkey" FOREIGN KEY ("cateId") REFERENCES "category"("cateId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categoryLevel" ADD CONSTRAINT "categoryLevel_userUserId_fkey" FOREIGN KEY ("userUserId") REFERENCES "user"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_userUserId_fkey" FOREIGN KEY ("userUserId") REFERENCES "user"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_levelId_fkey" FOREIGN KEY ("levelId") REFERENCES "categoryLevel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chapter" ADD CONSTRAINT "chapter_courseCouserId_fkey" FOREIGN KEY ("courseCouserId") REFERENCES "course"("couserId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chapter" ADD CONSTRAINT "chapter_userUserId_fkey" FOREIGN KEY ("userUserId") REFERENCES "user"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contacts" ADD CONSTRAINT "contacts_userUserId_fkey" FOREIGN KEY ("userUserId") REFERENCES "user"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Participant" ADD CONSTRAINT "Participant_callId_fkey" FOREIGN KEY ("callId") REFERENCES "GroupCall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Participant" ADD CONSTRAINT "Participant_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "readingGemes" ADD CONSTRAINT "readingGemes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "correctImg" ADD CONSTRAINT "correctImg_readingGemesId_fkey" FOREIGN KEY ("readingGemesId") REFERENCES "readingGemes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wrongImg" ADD CONSTRAINT "wrongImg_readingGemesId_fkey" FOREIGN KEY ("readingGemesId") REFERENCES "readingGemes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
