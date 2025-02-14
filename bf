import { useEffect, useState } from "react";
import { Button } from "@/components/ui/button";
import { motion } from "framer-motion";

export default function GreetingCard() {
  const [tg, setTg] = useState(null);
  const [accepted, setAccepted] = useState(false);

  useEffect(() => {
    if (window.Telegram?.WebApp) {
      const telegram = window.Telegram.WebApp;
      telegram.expand();
      setTg(telegram);
    }
  }, []);

  return (
    <div className="flex flex-col items-center justify-center h-screen bg-gradient-to-br from-pink-500 to-yellow-400 text-white text-center p-4">
      <motion.img
        src={accepted ? "https://source.unsplash.com/300x300/?happy" : "https://source.unsplash.com/300x300/?birthday"}
        alt="Открытка"
        className="mt-6 rounded-xl shadow-lg"
        initial={{ x: -300, opacity: 0 }}
        animate={{ x: 0, opacity: 1 }}
        transition={{ duration: 1 }}
      />
      <motion.h1
        className="text-4xl font-bold mt-4"
        initial={{ opacity: 0, y: 50 }}
        animate={{ opacity: 1, y: accepted ? -50 : 0 }}
        transition={{ duration: 1 }}
      >
        {accepted ? "Спасибо, что принял поздравление! 🎉" : "С Днём Рождения! 🎉"}
      </motion.h1>
      {!accepted && (
        <motion.p
          className="mt-4 text-lg"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.5, duration: 1 }}
        >
          Пусть твои мечты сбываются, а счастье не покидает тебя! 💖
        </motion.p>
      )}
      {!accepted && (
        <div className="mt-6 flex space-x-4">
          <Button className="bg-white text-pink-500 px-6 py-2 rounded-xl" onClick={() => setAccepted(true)}>
            Да
          </Button>
          <Button className="bg-white text-red-500 px-6 py-2 rounded-xl" onClick={() => tg?.close()}>
            Нет
          </Button>
        </div>
      )}
    </div>
  );
}
