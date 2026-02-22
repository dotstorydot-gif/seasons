"use client";

import React from 'react';
import Navbar from './Navbar';
import Footer from './Footer';
import styles from './Shell.module.css';

const Shell: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    return (
        <div className={styles.shell}>
            <Navbar />
            <main className={styles.main}>
                {children}
            </main>
            <Footer />
        </div>
    );
};

export default Shell;
