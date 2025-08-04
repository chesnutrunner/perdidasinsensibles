# Overview

This is a full-stack web application built with React and Express.js that implements a medical calculator for computing insensible fluid losses in nursing contexts. The application uses a modern tech stack with TypeScript, Tailwind CSS, and shadcn/ui components to create a professional dark-themed interface for healthcare professionals.

The app allows users to input three parameters (weight, temperature, and hours) via intuitive sliders and calculates insensible losses using a temperature-adjusted formula. It features a clean, mobile-responsive design optimized for healthcare environments.

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Frontend Architecture
- **Framework**: React 18 with TypeScript and Vite as the build tool
- **UI Framework**: shadcn/ui component library built on Radix UI primitives
- **Styling**: Tailwind CSS with custom CSS variables for theming
- **State Management**: React hooks for local component state
- **Routing**: Wouter for lightweight client-side routing
- **Data Fetching**: TanStack Query (React Query) for server state management

## Backend Architecture
- **Runtime**: Node.js with Express.js framework
- **Language**: TypeScript with ES modules
- **Development**: tsx for TypeScript execution in development
- **Build**: esbuild for production bundling
- **Middleware**: Basic Express middleware for JSON parsing and CORS

## Database Layer
- **ORM**: Drizzle ORM with PostgreSQL dialect
- **Database**: Configured for PostgreSQL via Neon Database serverless
- **Schema**: Centralized schema definition in shared directory
- **Migrations**: Drizzle Kit for schema migrations and management
- **Connection**: Environment-based DATABASE_URL configuration

## Development Setup
- **Monorepo Structure**: Client and server code in separate directories with shared schemas
- **Hot Reload**: Vite HMR for frontend and tsx watch mode for backend
- **Type Safety**: Strict TypeScript configuration across the entire stack
- **Path Aliases**: Configured import aliases for cleaner imports (@/, @shared/)

## UI/UX Design Decisions
- **Dark Theme**: Custom dark theme implementation with CSS variables
- **Component System**: Modular shadcn/ui components with consistent design tokens
- **Mobile-First**: Responsive design optimized for mobile healthcare environments
- **Accessibility**: Radix UI primitives ensure WCAG compliance
- **Color Scheme**: Healthcare-appropriate colors with green accents for actions

## Storage Layer
- **Development**: In-memory storage implementation for rapid prototyping
- **Production Ready**: Interface-based design allows easy swapping to database storage
- **Session Management**: PostgreSQL session store configured for production use

# External Dependencies

## Core Framework Dependencies
- **@vitejs/plugin-react**: React support in Vite build system
- **express**: Web application framework for Node.js backend
- **drizzle-orm**: Type-safe SQL ORM with PostgreSQL support
- **@neondatabase/serverless**: Serverless PostgreSQL database driver

## UI Component Libraries
- **@radix-ui/***: Complete set of accessible UI primitives (dialogs, dropdowns, forms, etc.)
- **@tanstack/react-query**: Server state management and caching
- **wouter**: Lightweight routing library for React
- **tailwindcss**: Utility-first CSS framework

## Development and Build Tools
- **typescript**: Type checking and compilation
- **vite**: Frontend build tool and development server
- **esbuild**: Fast JavaScript bundler for production builds
- **tsx**: TypeScript execution engine for Node.js
- **drizzle-kit**: Database schema management and migrations

## Utility Libraries
- **class-variance-authority**: Component variant management
- **clsx**: Conditional CSS class composition
- **date-fns**: Date manipulation and formatting
- **zod**: Runtime type validation and parsing
- **nanoid**: Unique ID generation

## Replit-Specific Integrations
- **@replit/vite-plugin-runtime-error-modal**: Development error overlay
- **@replit/vite-plugin-cartographer**: Development environment integration