USE [laboratoria]
GO

INSERT INTO [dbo].[roles] ([id], [name]) VALUES
(1, 'admin'),
(2, 'technologist'),
(3, 'lab_technician'),
(4, 'operator'),
(5, 'quality_controller');

INSERT INTO [dbo].[users] ([id], [login], [password_hash], [full_name], [role_id], [department]) VALUES
(1, 'admin', 'hash_admin123', 'Иванов Иван Иванович', 1, 'IT'),
(2, 'tech1', 'hash_tech123', 'Петров Петр Петрович', 2, 'Технологический отдел'),
(3, 'lab1', 'hash_lab123', 'Сидорова Анна Сергеевна', 3, 'Лаборатория'),
(4, 'lab2', 'hash_lab456', 'Кузнецова Елена Владимировна', 3, 'Лаборатория'),
(5, 'op1', 'hash_op123', 'Смирнов Алексей Николаевич', 4, 'Производственный цех'),
(6, 'qc1', 'hash_qc123', 'Михайлова Ольга Дмитриевна', 5, 'ОТК');

INSERT INTO [dbo].[products] ([id], [code], [name], [type], [form], [status]) VALUES
(1, 'CH-001', 'Сыр Российский 50%', 'сыр', 'круг', 'active'),
(2, 'CH-002', 'Сыр Голландский 45%', 'сыр', 'брусок', 'active'),
(3, 'CH-003', 'Сыр Моцарелла', 'сыр', 'шарики', 'active'),
(4, 'CH-004', 'Сыр Плавленый Сливочный', 'сыр', 'брусок', 'active'),
(5, 'CH-005', 'Сыр Косичка', 'сыр', 'косичка', 'active'),
(6, 'ML-001', 'Масло сливочное 82.5%', 'масло', 'брусок', 'active'),
(7, 'ML-002', 'Масло Крестьянское 72.5%', 'масло', 'брусок', 'active');


INSERT INTO [dbo].[raw_materials] ([id], [name], [category], [unit]) VALUES
(1, 'Молоко пастеризованное', 'основное', 'л'),
(2, 'Молоко сухое обезжиренное', 'основное', 'кг'),
(3, 'Закваска мезофильная', 'биокультура', 'уп'),
(4, 'Закваска термофильная', 'биокультура', 'уп'),
(5, 'Фермент сычужный', 'биокультура', 'мл'),
(6, 'Соль пищевая', 'вспомогательное', 'кг'),
(7, 'Хлорид кальция', 'вспомогательное', 'мл'),
(8, 'Сливки', 'основное', 'л'),
(9, 'Масло растительное', 'вспомогательное', 'л'),
(10, 'Консервант сорбиновая кислота', 'добавка', 'г');

INSERT INTO [dbo].[recipes] ([id], [product_id], [version], [status], [approved_date], [author_id]) VALUES
(1, 1, 1, 'approved', '2024-01-15', 2),
(2, 2, 1, 'approved', '2024-01-20', 2),
(3, 3, 1, 'approved', '2024-02-01', 2),
(4, 6, 1, 'approved', '2024-02-10', 2),
(5, 1, 2, 'draft', '2024-03-01', 2);

INSERT INTO [dbo].[recipe_components] ([id], [recipe_id], [raw_material_id], [percentage], [load_order], [tolerance]) VALUES
(1, 1, 1, 85.0, 1, 2.0),
(2, 1, 3, 0.5, 3, 0.1),
(3, 1, 5, 0.3, 4, 0.05),
(4, 1, 6, 1.2, 5, 0.2),
(5, 1, 7, 0.1, 2, 0.02);
INSERT INTO [dbo].[recipe_components] ([id], [recipe_id], [raw_material_id], [percentage], [load_order], [tolerance]) VALUES
(6, 2, 1, 82.0, 1, 2.0),
(7, 2, 2, 5.0, 2, 1.0),
(8, 2, 4, 0.4, 3, 0.1),
(9, 2, 5, 0.3, 4, 0.05),
(10, 2, 6, 1.5, 5, 0.2);

-- Компоненты рецептов (Моцарелла)
INSERT INTO [dbo].[recipe_components] ([id], [recipe_id], [raw_material_id], [percentage], [load_order], [tolerance]) VALUES
(11, 3, 1, 90.0, 1, 2.0),
(12, 3, 4, 0.6, 2, 0.1),
(13, 3, 5, 0.4, 3, 0.05),
(14, 3, 6, 1.0, 4, 0.2);

-- Компоненты рецептов (Масло сливочное)
INSERT INTO [dbo].[recipe_components] ([id], [recipe_id], [raw_material_id], [percentage], [load_order], [tolerance]) VALUES
(15, 4, 8, 98.5, 1, 1.0),
(16, 4, 6, 1.5, 2, 0.2);

-- Технологические карты
INSERT INTO [dbo].[tech_maps] ([id], [product_id], [version], [status]) VALUES
(1, 1, 1, 'approved'),
(2, 2, 1, 'approved'),
(3, 3, 1, 'approved'),
(4, 6, 1, 'approved');

-- Технологические шаги (Сыр Российский)
INSERT INTO [dbo].[tech_steps] ([id], [tech_map_id], [step_number], [name], [type], [instruction]) VALUES
(1, 1, 1, 'Приёмка молока', 'input', 'Проверить качество молока по органолептическим показателям'),
(2, 1, 2, 'Нормализация', 'process', 'Довести жирность до 3.2%'),
(3, 1, 3, 'Пастеризация', 'process', 'Нагреть до 72°C, выдержать 20 секунд'),
(4, 1, 4, 'Охлаждение', 'process', 'Охладить до 32°C'),
(5, 1, 5, 'Внесение закваски', 'process', 'Внести мезофильную закваску 0.5%'),
(6, 1, 6, 'Свёртывание', 'process', 'Выдержать 40 минут до образования сгустка'),
(7, 1, 7, 'Разрезка сгустка', 'process', 'Нарезать кубиками 1x1 см'),
(8, 1, 8, 'Постановка сырного зерна', 'process', 'Вымешивать 30 минут'),
(9, 1, 9, 'Формование', 'process', 'Слить сыворотку, сформовать головки'),
(10, 1, 10, 'Прессование', 'process', 'Прессовать 4 часа под давлением'),
(11, 1, 11, 'Посолка', 'process', 'Посолить в рассоле 8-10 часов'),
(12, 1, 12, 'Созревание', 'output', 'Выдержать 30 дней при t 12°C и влажности 85%');

-- Технологические шаги (Сыр Голландский)
INSERT INTO [dbo].[tech_steps] ([id], [tech_map_id], [step_number], [name], [type], [instruction]) VALUES
(13, 2, 1, 'Приёмка молока', 'input', 'Проверить качество молока'),
(14, 2, 2, 'Нормализация', 'process', 'Довести жирность до 2.5%'),
(15, 2, 3, 'Пастеризация', 'process', 'Нагреть до 72°C'),
(16, 2, 4, 'Внесение закваски', 'process', 'Внести термофильную закваску'),
(17, 2, 5, 'Свёртывание', 'process', 'Выдержать 35 минут'),
(18, 2, 6, 'Обработка сгустка', 'process', 'Нарезать, вымешать'),
(19, 2, 7, 'Формование', 'process', 'Сформовать головки'),
(20, 2, 8, 'Прессование', 'process', 'Прессовать 3 часа'),
(21, 2, 9, 'Созревание', 'output', 'Выдержать 45 дней');

-- Параметры шагов (для контроля)
INSERT INTO [dbo].[step_parameters] ([id], [step_id], [param_name], [min_value], [max_value], [unit]) VALUES
(1, 3, 'Температура пастеризации', 70, 74, '°C'),
(2, 3, 'Время выдержки', 15, 25, 'сек'),
(3, 5, 'Температура внесения закваски', 30, 34, '°C'),
(4, 6, 'Время свёртывания', 35, 45, 'мин'),
(5, 8, 'Температура второго нагревания', 38, 42, '°C'),
(6, 10, 'Давление прессования', 5, 8, 'кг/см²');


INSERT INTO [dbo].[production_orders] ([id], [order_number], [product_id], [recipe_id], [planned_quantity], [status], [created_at]) VALUES
(1, 'ЗАК-001', 1, 1, 5000.00, 'completed', '2024-03-01'),
(2, 'ЗАК-002', 2, 2, 3000.00, 'completed', '2024-03-05'),
(3, 'ЗАК-003', 3, 3, 2000.00, 'completed', '2024-03-10'),
(4, 'ЗАК-004', 6, 4, 1000.00, 'in_progress', '2024-03-15'),
(5, 'ЗАК-005', 1, 1, 4000.00, 'planned', '2024-03-20'),
(6, 'ЗАК-006', 4, 1, 1500.00, 'planned', '2024-03-25');


INSERT INTO [dbo].[production_batches] ([id], [order_id], [batch_number], [status], [tech_map_id]) VALUES
(1, 1, 'ПАР-001-24', 'completed', 1),
(2, 1, 'ПАР-002-24', 'completed', 1),
(3, 2, 'ПАР-003-24', 'completed', 2),
(4, 2, 'ПАР-004-24', 'completed', 2),
(5, 3, 'ПАР-005-24', 'completed', 3),
(6, 4, 'ПАР-006-24', 'in_progress', 4),
(7, 5, 'ПАР-007-24', 'planned', 1),
(8, 5, 'ПАР-008-24', 'planned', 1);


INSERT INTO [dbo].[step_executions] ([id], [batch_id], [step_id], [status]) VALUES
(1, 1, 1, 'completed'),
(2, 1, 2, 'completed'),
(3, 1, 3, 'completed'),
(4, 1, 4, 'completed'),
(5, 1, 5, 'completed'),
(6, 1, 6, 'completed'),
(7, 1, 7, 'completed'),
(8, 1, 8, 'completed'),
(9, 1, 9, 'completed'),
(10, 1, 10, 'completed'),
(11, 1, 11, 'completed'),
(12, 1, 12, 'completed');


INSERT INTO [dbo].[step_actual_params] ([id], [execution_id], [param_id], [actual_value], [comment]) VALUES
(1, 3, 1, 72, 'Норма'),
(2, 3, 2, 20, 'Норма'),
(3, 5, 3, 32, 'Норма'),
(4, 6, 4, 38, 'Норма');


INSERT INTO [dbo].[lab_tests] ([id], [object_type], [object_id], [status], [decision], [reason], [user_id]) VALUES
(1, 'raw_material', 1, 'completed', 'accepted', NULL, 3),
(2, 'raw_material', 3, 'completed', 'accepted', NULL, 3),
(3, 'product_batch', 1, 'completed', 'accepted', NULL, 4),
(4, 'product_batch', 2, 'completed', 'accepted', NULL, 4),
(5, 'product_batch', 3, 'completed', 'accepted', NULL, 4),
(6, 'product_batch', 4, 'completed', 'accepted', NULL, 4),
(7, 'product_batch', 5, 'completed', 'blocked', 'Влажность превышает норму', 4),
(8, 'product_batch', 6, 'in_progress', NULL, NULL, 3);


INSERT INTO [dbo].[test_results] ([id], [test_id], [parameter_name], [norm_min], [norm_max], [actual_value]) VALUES
(1, 3, 'Влажность', 0, 15, 12.5),
(2, 3, 'Чистота', 95, 100, 98.0),
(3, 3, 'Жирность', 50, 52, 51.2),
(4, 4, 'Влажность', 0, 15, 13.0),
(5, 4, 'Чистота', 95, 100, 97.5),
(6, 5, 'Влажность', 0, 15, 11.8),
(7, 5, 'Чистота', 95, 100, 98.5),
(8, 6, 'Влажность', 0, 15, 10.5),
(9, 6, 'Чистота', 95, 100, 99.0),
(10, 7, 'Влажность', 0, 15, 18.0), 
(11, 7, 'Чистота', 95, 100, 92.0), 
(12, 8, 'Влажность', 0, 15, NULL),
(13, 8, 'Чистота', 95, 100, NULL);


INSERT INTO [dbo].[test_results] ([id], [test_id], [parameter_name], [norm_min], [norm_max], [actual_value]) VALUES
(14, 1, 'Кислотность', 16, 20, 18),
(15, 1, 'Плотность', 1.028, 1.032, 1.030),
(16, 1, 'Бактериальная обсеменённость', 0, 100000, 50000),
(17, 2, 'Активность', 80, 100, 95);

INSERT INTO [dbo].[batch_raw_usage] ([id], [batch_id], [raw_batch_id], [actual_quantity]) VALUES
(1, 1, 1, 4250.0),
(2, 1, 3, 25.0),
(3, 1, 5, 60.0),
(4, 2, 1, 4200.0),
(5, 2, 3, 24.0),
(6, 2, 5, 58.0);



INSERT INTO [dbo].[deviations] ([id], [batch_id], [step_execution_id], [param_name], [planned_value], [actual_value], [severity], [description], [created_at]) VALUES
(1, 7, NULL, 'Влажность', '≤15', '18', 'critical', 'Превышение влажности в готовом продукте', '2024-03-18 10:30:00'),
(2, 7, NULL, 'Чистота', '≥95', '92', 'critical', 'Низкая чистота продукта', '2024-03-18 10:35:00');


INSERT INTO [dbo].[audit_log] ([id], [user_id], [action], [entity_type], [entity_id], [created_at]) VALUES
(1, 2, 'CREATE', 'production_batch', 1, '2024-03-01 08:00:00'),
(2, 3, 'CREATE', 'lab_test', 1, '2024-03-01 09:00:00'),
(3, 4, 'UPDATE', 'lab_test', 3, '2024-03-05 14:30:00'),
(4, 4, 'UPDATE', 'lab_test', 4, '2024-03-10 11:00:00'),
(5, 4, 'UPDATE', 'lab_test', 5, '2024-03-12 16:00:00'),
(6, 4, 'UPDATE', 'lab_test', 6, '2024-03-15 10:00:00'),
(7, 4, 'UPDATE', 'lab_test', 7, '2024-03-18 10:30:00'),
(8, 3, 'CREATE', 'deviation', 1, '2024-03-18 10:40:00'),
(9, 3, 'CREATE', 'deviation', 2, '2024-03-18 10:40:00');


SELECT 'Таблица' AS Table_Name, COUNT(*) AS Records FROM [dbo].[users] UNION ALL
SELECT 'roles', COUNT(*) FROM [dbo].[roles] UNION ALL
SELECT 'products', COUNT(*) FROM [dbo].[products] UNION ALL
SELECT 'raw_materials', COUNT(*) FROM [dbo].[raw_materials] UNION ALL
SELECT 'recipes', COUNT(*) FROM [dbo].[recipes] UNION ALL
SELECT 'recipe_components', COUNT(*) FROM [dbo].[recipe_components] UNION ALL
SELECT 'tech_maps', COUNT(*) FROM [dbo].[tech_maps] UNION ALL
SELECT 'tech_steps', COUNT(*) FROM [dbo].[tech_steps] UNION ALL
SELECT 'step_parameters', COUNT(*) FROM [dbo].[step_parameters] UNION ALL
SELECT 'production_orders', COUNT(*) FROM [dbo].[production_orders] UNION ALL
SELECT 'production_batches', COUNT(*) FROM [dbo].[production_batches] UNION ALL
SELECT 'step_executions', COUNT(*) FROM [dbo].[step_executions] UNION ALL
SELECT 'step_actual_params', COUNT(*) FROM [dbo].[step_actual_params] UNION ALL
SELECT 'lab_tests', COUNT(*) FROM [dbo].[lab_tests] UNION ALL
SELECT 'test_results', COUNT(*) FROM [dbo].[test_results] UNION ALL
SELECT 'batch_raw_usage', COUNT(*) FROM [dbo].[batch_raw_usage] UNION ALL
SELECT 'deviations', COUNT(*) FROM [dbo].[deviations] UNION ALL
SELECT 'audit_log', COUNT(*) FROM [dbo].[audit_log]
ORDER BY Table_Name;


SELECT 
    pb.id,
    pb.batch_number,
    p.name AS product_name,
    CASE 
        WHEN lt.decision = 'accepted' THEN 'Допущена'
        WHEN lt.decision = 'blocked' THEN 'Заблокирована'
        ELSE 'В процессе'
    END AS status,
    lt.reason AS block_reason
FROM production_batches pb
JOIN production_orders po ON pb.order_id = po.id
JOIN products p ON po.product_id = p.id
LEFT JOIN lab_tests lt ON lt.object_id = pb.id AND lt.object_type = 'product_batch'
ORDER BY pb.id;