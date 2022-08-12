PGDMP     ,    :                z            farmis_test    14.1    14.1 H    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            L           1262    25335    farmis_test    DATABASE     k   CREATE DATABASE farmis_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE farmis_test;
                postgres    false            �            1259    25603    cow    TABLE       CREATE TABLE public.cow (
    id bigint NOT NULL,
    kode character varying(5) NOT NULL,
    nama character varying(30) NOT NULL,
    bobot integer NOT NULL,
    tgl_lahir date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.cow;
       public         heap    postgres    false            �            1259    25975    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    25974    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    217            M           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    216            �            1259    25337 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    25336    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    210            N           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    209            �            1259    26099    milk    TABLE       CREATE TABLE public.milk (
    id bigint NOT NULL,
    jumlah bigint NOT NULL,
    tanggal date NOT NULL,
    id_users bigint NOT NULL,
    id_cow character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.milk;
       public         heap    postgres    false            �            1259    26098    milk_id_seq    SEQUENCE     t   CREATE SEQUENCE public.milk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.milk_id_seq;
       public          postgres    false    225            O           0    0    milk_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.milk_id_seq OWNED BY public.milk.id;
          public          postgres    false    224            �            1259    25968    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false            �            1259    25987    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false            �            1259    25986    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    219            P           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    218            �            1259    25602    sapi_id_seq    SEQUENCE     t   CREATE SEQUENCE public.sapi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sapi_id_seq;
       public          postgres    false    212            Q           0    0    sapi_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE public.sapi_id_seq OWNED BY public.cow.id;
          public          postgres    false    211            �            1259    26008    schedule    TABLE     K  CREATE TABLE public.schedule (
    id bigint NOT NULL,
    judul character varying(30) NOT NULL,
    tanggal date NOT NULL,
    id_users bigint NOT NULL,
    id_cow character varying(5) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.schedule;
       public         heap    postgres    false            �            1259    26007    schedule_id_seq    SEQUENCE     x   CREATE SEQUENCE public.schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.schedule_id_seq;
       public          postgres    false    221            R           0    0    schedule_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.schedule_id_seq OWNED BY public.schedule.id;
          public          postgres    false    220            �            1259    26090    transaction    TABLE       CREATE TABLE public.transaction (
    id bigint NOT NULL,
    jenis smallint NOT NULL,
    nominal bigint NOT NULL,
    tanggal date NOT NULL,
    keterangan text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.transaction;
       public         heap    postgres    false            �            1259    26089    transaction_id_seq    SEQUENCE     {   CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.transaction_id_seq;
       public          postgres    false    223            S           0    0    transaction_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;
          public          postgres    false    222            �            1259    25957    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    no_hp character varying(12) NOT NULL,
    alamat text NOT NULL,
    password character varying(255) NOT NULL,
    type smallint DEFAULT '2'::smallint NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25956    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    214            T           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    213            �           2604    25606    cow id    DEFAULT     a   ALTER TABLE ONLY public.cow ALTER COLUMN id SET DEFAULT nextval('public.sapi_id_seq'::regclass);
 5   ALTER TABLE public.cow ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    25978    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    25340    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    26102    milk id    DEFAULT     b   ALTER TABLE ONLY public.milk ALTER COLUMN id SET DEFAULT nextval('public.milk_id_seq'::regclass);
 6   ALTER TABLE public.milk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    25990    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    26011    schedule id    DEFAULT     j   ALTER TABLE ONLY public.schedule ALTER COLUMN id SET DEFAULT nextval('public.schedule_id_seq'::regclass);
 :   ALTER TABLE public.schedule ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    26093    transaction id    DEFAULT     p   ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);
 =   ALTER TABLE public.transaction ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    25960    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            9          0    25603    cow 
   TABLE DATA           W   COPY public.cow (id, kode, nama, bobot, tgl_lahir, created_at, updated_at) FROM stdin;
    public          postgres    false    212   �T       >          0    25975    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    217   �V       7          0    25337 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    210   �V       F          0    26099    milk 
   TABLE DATA           ]   COPY public.milk (id, jumlah, tanggal, id_users, id_cow, created_at, updated_at) FROM stdin;
    public          postgres    false    225   }W       <          0    25968    password_resets 
   TABLE DATA           C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public          postgres    false    215   #g       @          0    25987    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
    public          postgres    false    219   @g       B          0    26008    schedule 
   TABLE DATA           h   COPY public.schedule (id, judul, tanggal, id_users, id_cow, created_at, updated_at, status) FROM stdin;
    public          postgres    false    221   ]g       D          0    26090    transaction 
   TABLE DATA           f   COPY public.transaction (id, jenis, nominal, tanggal, keterangan, created_at, updated_at) FROM stdin;
    public          postgres    false    223   �h       ;          0    25957    users 
   TABLE DATA           �   COPY public.users (id, name, email, email_verified_at, no_hp, alamat, password, type, remember_token, created_at, updated_at) FROM stdin;
    public          postgres    false    214   �       U           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    216            V           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 57, true);
          public          postgres    false    209            W           0    0    milk_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.milk_id_seq', 522, true);
          public          postgres    false    224            X           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          postgres    false    218            Y           0    0    sapi_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sapi_id_seq', 36, true);
          public          postgres    false    211            Z           0    0    schedule_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.schedule_id_seq', 21, true);
          public          postgres    false    220            [           0    0    transaction_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transaction_id_seq', 661, true);
          public          postgres    false    222            \           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 13, true);
          public          postgres    false    213            �           2606    25983    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    217            �           2606    25985 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    217            �           2606    25342    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    210            �           2606    26104    milk milk_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.milk
    ADD CONSTRAINT milk_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.milk DROP CONSTRAINT milk_pkey;
       public            postgres    false    225            �           2606    25994 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    219            �           2606    25997 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    219            �           2606    25610    cow sapi_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.cow
    ADD CONSTRAINT sapi_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY public.cow DROP CONSTRAINT sapi_pkey;
       public            postgres    false    212            �           2606    26015    schedule schedule_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_pkey;
       public            postgres    false    221            �           2606    26095    transaction transaction_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public            postgres    false    223            �           2606    26037    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    214            �           2606    25965    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    214            �           1259    26072    cow_kode_uindex    INDEX     F   CREATE UNIQUE INDEX cow_kode_uindex ON public.cow USING btree (kode);
 #   DROP INDEX public.cow_kode_uindex;
       public            postgres    false    212            �           1259    25973    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public            postgres    false    215            �           1259    25995 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    219    219            �           2606    26110    milk milk_id_cow_foreign    FK CONSTRAINT     v   ALTER TABLE ONLY public.milk
    ADD CONSTRAINT milk_id_cow_foreign FOREIGN KEY (id_cow) REFERENCES public.cow(kode);
 B   ALTER TABLE ONLY public.milk DROP CONSTRAINT milk_id_cow_foreign;
       public          postgres    false    3216    225    212            �           2606    26105    milk milk_id_users_foreign    FK CONSTRAINT     z   ALTER TABLE ONLY public.milk
    ADD CONSTRAINT milk_id_users_foreign FOREIGN KEY (id_users) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.milk DROP CONSTRAINT milk_id_users_foreign;
       public          postgres    false    214    225    3222            �           2606    26073     schedule schedule_id_cow_foreign    FK CONSTRAINT     ~   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_id_cow_foreign FOREIGN KEY (id_cow) REFERENCES public.cow(kode);
 J   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_id_cow_foreign;
       public          postgres    false    221    3216    212            �           2606    26016 "   schedule schedule_id_users_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_id_users_foreign FOREIGN KEY (id_users) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_id_users_foreign;
       public          postgres    false    221    214    3222            9   �  x��S�J�@<�<E^ ��󓙹��IAQA/�o��������̲.~B��.��+�z��e��K`�0b˱��O���>ǌ�=*v���	ԃ����b*�~�����l�A�'��b=P����U#T�o����D �����m��wJu	�@lf1��D/ˏմX��E��m�E���`tZ,���ur�r,d�|lm��`��40�-�I6fW1�6{�#B7���4�U	��1wt��s����sX��PS�~M�0M��
E�Ȅƀ״��n�u�يK�}��"l)�mg����9̈�����H])R�P�	Y�ÌxzLt�^�|=��I��ft�K)����SN��s�-2�X��M��IS�oi�	�w'���!����c�7�.��      >      x������ � �      7   �   x�U�[� �oY�
T�b2�t��h�}�J	!|���+�S&�Q`�z��	a�"$�Y�0"Y-�I~u��=���_2w�7X�S��=�}W�f�� �yv���x�-hc0��UQ��<W�m�jD�?WP����-0����?V;�k�&�U�)h�I�w��D���y���?�wؐǕ�<*se      F   �  x���K�c�EǮUdH$��Y2J� A� @���<I�E�m�Ѓ�r���D����-��$��Y�����7����Q����ʯ����g_z����~�~��﷿�V��+_��$�r�o��p�e}
Ke�]oY�;��-�Vo���p�e�p��K�w����������&�s>o]�s����i]G���z�����������������I���ݞJz�}�vy{��f/4�~��h�����7�K���<��:�r��ϥ��vJ������t>���������yޗ�]Lߪ�'i�-�~��{_�R��A����󩩝��Ի��:����ҵr��4��k���c�M�qߵ��y�9X�ҏ�5^�\��^?���k�m7�-*GS/˴����IZÉ�i[�X�O�v���3��j9�|=���L���і6o	��vlK�������t�N�ʴe�}ɺc",�iK~��D���y�>OLn�����Ȓ��[�IZ�k��1�3;�������s�����k�Dv�7����^wX&�缯O�=�ƹ�:}(�Ԓ�'�~��]�y�>-�{��I��-�:�k����^z��C)��yCߣ�O�����'4��t�K׀7(N[��N̮����L5��������$���[[��7�Jxoe�V��{�@{�<�O��s���c��%*��'.ѩk���|^��+����x#��������'�i"����Ʃdm	QM����֡��-�eR��!\�$�c-���nI�^p0������{�P"���; oІ�� 鞎/�i��{�nɴ�@׺�]���Z׳v�Q�-ݞ{>1�2����߲I&�r{=�dYd&�<V��pj������>|{��B��H޶�0:�։����%*�>�[�X�a����ϑ��4՘�����@�5\$�6c0�p�d��M�|<�'k!,.�)y,��b�n��N{�[�tL�|xH�K�^\18@>9�N��C�+'g�tn]%V=�z.�2��y���ͳ������,��lN��0�u��w��`�5��`����r�@��uY�oX\���S�m�mB�d�%`��ll�����?s٫� ��� �eP��~g���3���/�8�v�:l����1��}��������"�,v�F�������+d����2:���D1�\(�u.-��sf�f^��Y3c��&��8m���ˮ��y���PmT��-V���L8x �ܵx\%��Y����.���������˹��1?3{��b�<S�\]�9v�nDK��ě��"Z7��]a�����	&��w
Ĵ3QP�GbZk��I�N��n��堉xԺU� ���u�`h]����|=�6E��v��p u���'JUB�\��ش��X���{�ɭ<s�P��GH��H�&M��2й�p o���3�ir{�������i]5���A���\w@��k`�({P���+����{�M0��g��$ R�Ш�S�!�L��-�R4�	����U��t$�m�]�Ƶl�k�$l%(ѻw_?�X#
������*��t���C�@9��ߝ�I��N"�~8��a�OB�lՂF��#�:����p`����ٺ� s�]b|������	N���?���y"~ ��y����ׄ�D�&���ȑx	i��Q����!�j���U"�@>,dE�v<��a.��IJ�`O��2�\����;?�����)/T�'I�����2�}W�g�I��n��-I՛�Ř�w?��Ĵ�yI=b�ʈ����uV� 9�p�����j�>�,��rԒ�w�7��;.��{@#)y���6�In���Xћ��+��F���+8�9x~�Hc�Z$���/��O"5��T�f,��#Z�Nm��]C�l[G܄�@}��@ś�e�����1���g��1��5F�#��B��f*U^*�����.&8�,�5o�W������Z��Ew�jt��j�PC����A���$��B�튤�xhm���M<w���Y,����.�����\X	�B����~ ܘ�����N�(��`[Z��ֆ�me@��6�z)9��:�"G���ȹ��R��0���ȕ�#:_B*s�"�ꏮ�N`NJJ�q��GJD뀶��P�:���ف���;�V�ه��P�vF9�6�';_C}�,�֙8��+L����H��2�cU60#��>b���
��5j�AxP_�s�L�[�� |!+rp-�"�E:�+��g�̿K��ʚ k�,��`7�4�aW;������CkӚ7BcX�e0�}Н!#��h]z�5��Y2Qz~)�d[��#�L�|W_0�jN���������uW�Qw61=%J>�܄�I5Vs"������}�j�=�Ⱦ$5QP:�O�X�D�u�%��^��Ͱ�d�g��Ϣ�Q=���F�K��}ĲJ2��R���&�]ض�dhA��Y.(/�3;pp���&����܂T��M������}'���7�a�� ��|yX���F��0#�.;�KRQ��f�u�!�Js�iW	L�f��I���i6�����49��J�j���!p����>(+�3;П�,��<^Z�P(���?�ݻ҉����E�-XbJU,݀���3�5?�&���J�ש��,����8�.;I��&V��:͞-�>N��2�����z���z`U��������>��5غ݄v�߿f*;�����ÒT�P�f*[��#�4.�lTM��İj�����s7WѪ{
9w+��Э���t���j�Ss}�+��<�ź:���Z�]h���E
����J�N���-�8X����i?{�!�a�����>�W'�=<<����0�&��@�� \k�3�A��^C�آ�Ʌ���*�t�j>�(4�;eȵV�Y��H�6��3�=�EI������X ޒo�Z9y��}-�
���77���.lre�|v$UXنz�=��(ڊ_}�2��k���+�^gt;�JЅ�Uj;�ln���jZ��<Q�����Q�$��A�1��ߝV�kwc��C����?gҒ՛���p���{�y���G�d�L���R��.���.�'v�m���l!�g��܃����?�o.G���}�R�z���w=�eN�x��(~��<,�ǉxM�Rؖ$�W8�4`����3���$6���p�����wLi��
�ys���xɌ���}�a��M~��k�������X����G��>�ŗ�.P�V��N�,���ȇ����|���NX$�i���J� ���&��"1��~ؾ|�.����H��6��*/��L4T>dƘ��?w�,+dR����I���8"�<�M'�t�e�ãw^|�i$Z�)��Nd��|��d�4+:�����GB�+���9QNʴ��Ox�����i�x~���q�i�Հ�Fc�腵`!�k��H㒝7	����7�Cm��[	��Kt>����!kdV=8�Mf�xA��Y�nB3�̆/��۔GI�<�Ŀ���qx�"a�l�����f�w7��<{u�6����psف��t��o! ��V��H_va�S����V���M��+Ss��VWiUBcc���e��5��5R4���y�N*��^��0f�z�6t���6�5�m�)��#�������x�r��+'MB[Xؚ�r��f�|e���h%����2_~�xꂵ�}JϽ��w�JW~��F�z�	tZ,d=���ĸJ���1��k�:ߠ��N�d�R�z���
�UZ'�Jٳ�^�ôQ�z�mV��Z�ecؑ��[d#ٺ�&�F��R�Nk�B"�@/3�/�Z��d�G�J���x��@J��0�lu��-)4�PL[���*Q(TR��k�(��������#�9�g\������pp%�y�0�TR�њ`[eI!�� _W��/;7>��
��7��A�hT���W
��M�Qd�o���z��e���#~=J��[ �l`�_R���g�x�
}w9��3k��|��___��%      <      x������ � �      @      x������ � �      B   T  x�u��N�0е��������w���"�Abc��F���~���%�˪��̝K��6����"u�����
�S��߀F�M��)Ȱ:z�����K�`���]5x#�3*qJ������d��s���y�������Z��v�<c�7:1�&WO�M[7��n��t�包vj�c:N]�F7qס�e���y�p��O�U�	Ź���\�u.������8$N8O�f�B3�%ou��҅q���J�x�J	��sW��J�[��k���H&4���D � HzS�6�0o��� ����ߖ�B�n�{��)���&ޝc^/�,�~q�      D      x����rc9����O1/��?K�(��*Eز�KF?���t�0fF�M��_p�	����P[)�\��]�������q���������.>�&��-B�n���/O������eLLw�_6���Ǘ�}��K�e��tx=��uz;]~�߿* j��	r���������ː
���5� ��CI��_����uF�R{e���ϯ��w��;���x�:��~4�"��Ǘ����������I�Zs�C����ݽXO/_W�:���9��ٯ3PbŅ>'6�?�@y���ݬ^���3��j�MF�Jta8��Z�3+�������������0�V���XPj@�E���"(����a�zr��};��������&��Ir�p~~=�</t���ڤ���<�8,X���1���T/,�0�}�L���������}C���t�I��}};��O���dZ5�nK����{>����A:5Ǉ�t~}_hHth����!Ұj ���]D�k��WX�I ����^?΂�5��k�q[�u,�����O�pzb�sd��寿����������y�:�`h��p]��d�K���yZ�i�li~���5�I�tl�w�n���~]�ih\q���5�~|�F@+[r�S��fj�Ր�B���t��s�G#��Ѐ���M�T��tA5�Pj�ѥߚ�ui�Mu�i��G�1@�P��k`YRjj8;�%֚z�8]NK�ԐҦL���C`�����ha{v�O�z�k�[�k��L=X�]c�C��o�2�b��޷12��t�<ƶMi�a�.�λxZ��j8/��"����B�q_�#0&pFdC��Y!�Xa<�$������ޢ�lb.��H������+��m�sr�|<���5�S��S��p�~:)(��cg�!�&�{�C�A��_��(GG�dx�){؆
{&�����稸v���X�l������/�����J{P���C��Cw,mYt)��´W�X>����5�kl�F��s�Gt�x�x��.E�*�:Z)�f�����O���]8����:_�u���,���5�����b�*�\أέ������3�)�V����
ia)z>=����7�9�>\����v�Ǐ]<��nW7~�V+�����vz�|?�g\ �z�/������C�A��W!�$�]����P�5���0�K�@C�vc�۞�Og ��[��lT*�ɯ�CnIOFt�7֖Y+�a��ۘ�P�J��T'ԫ����6���h��8���C��+2C���[�`��$����h-W?��8W9/4��P���i�?�O�__�=\'�u�����5
5קD �8��\h	�ٖ�\4��^Oo�c��^:�4�`��%�����v�B���96���OO+3M��4��+��ؓ;3�@ ��¶9DɊ� ��s�]��i�����%y����^�H�:���7��bKη���X�ד�����'�8�4X(���M*�����@т�)e�������coJ���g�(�'�`��;��8�:���@鵼��D����o��ѩ"�T`�ۙ��zxy|<���,�th�Հ� �[a$h�����\a�˗ �˴]�j�`w������5 h7�,��h�M(T`K��^�Ű��X�V��.����\�/%�G߂��6H(��66ԢQ6�x��̄e�5�Dޥ��2\��6{2���+Á�� �[;���[Bq�<�Q@Ł"��f*<v��m�B0(Cz���j,������[�L(P���q�Yڗ�(�:��=���A!�`�7
,X���@��[I�pD�"P���ۮ`LRP� L���5Oـ[���&#6�5N�;2}9�;��G����%�����>���>���ӳ`�UH'ݕ4%컔���}���R�p�l0hc^\����JB�R���N��U��D.]�l�`�n]onZtlo� qAq��
.��8H�<U�Pm`șh�������)(0�)���JC����3qY�d�k�y.eaD��12�5Os�����q�dc�(�X$NR�]�
��(�VqOw���E�
A�A����vХ�����bPn���vK���\JmJ���ɏ� 4q1����18cO��;(6 �#�@ĺ6
!'?���Lg�������<��	�?!��
iF��h0"����eљ����s�$�h�R���)V���u`*��E8T5d�F�3U4t*U�J�l5j�,�I�=E�����OH�{6��Ǫ$o���W��T)w�v��ՏAT�t=�yb��USI��Է�Dr��sy�벿���c���N�4�����`�lJL�QCC�x΀�l D�3(��Cf�閐���P7����I�ϧÇɖ$l@P19F��Ȟ�?�H�ͳP��J�Iv�Q"��O�+B��C���?��Ȁ�h!lf���j���Y=�3@(��{`�Z��m �ށ�F�����44�}	1��t�������3[H^�2v�G���;��i.���9�D3>���U�uz��}��.9ݒ��cmqa�r]�.���4��������Y�R��n���tV'_R�N�-����m���H���@�²����x�R����8d|!�b�rx}Ws��� ��[J�K� ��J�`P� �-�	����xz�y�Y$Tp�)�ٞ(�OE�~�8
�c#^�26��Y�0ljOe��i���o���RP��b�����愒zk|p��#�^!��*J�i`H�#o6G���^�B���0�Die,���4k���ɷ����Q7�	����N-zozEqE/�v9�?�?�L���߀B���2{qh,�u�w�_��~�(*.%5a�8��V;H��tٮ����k=BA��U� ���R��BPȥ��ߛ�X�LQ�HlQN�N���pt��#�~"�L���������rU������65�ċ�j�S+�˗�tf��؊M��I�����>��f_����A@�vX�q��ZT�����`����=��I81g?�8Η��Oq�����h�>��ѯ
(�.�MU�誐��-�qU^�*-oC7�@�;DG��s��0���r�q0�}c��O� �t#j��=�zj����R�z�Ku(|c�JJ�������8T<�P)$�|=����5SE��V��O�%�]P��u=��,ϯ����LS��3����5Uqh��LƍΒ�¤n��gWMp���v@�vɫ�۷�ɫ��������I1���hs���k�itTD"�K�=���S�d��~u�x-�� 3����h`�����f��d�B��'98S)(��cS|�i0��VJ�#+�I�����Lg؎�V�����jw�昁
ԫ룋�D���)�dr��������ޘ�p���t��ǈ	;���H̑�B��5�z[�KSNf�8�\�����ws)����ʠ8��Ėc��ܕA�L�(��{�ԖJ���4ג��j��=�f��p��SL��U	����d1���ۑf�(i����!�� n�)O�Y��ʷ�k�� ��g}p;��(�T���#�[B�֭��7�8��^�$Tp鮖ٟ,��F68��&���<�_����t�r��&��v����}-l��|�۠$��m�=�1P�����_J��ࠖs+��i��֦�<)6���Aid��^����B՜Jm�������0EÛ��U�O�� ʹ��Հ�U��͡�G>+ rv-��x#0H$�Z�l��~F���6x�dE6��?�K�ON
J��V���s�����;�)��}��@t2Wy���/��*��1.�Y=��.�+���4�?rj�
���`P���m�Q**�[�D%���evH�l0P�=�m����|;�����ɧ����S�#s��I4�[Z(qCq�o0P�`/����utâ�<����U��`�p�s=r�ʠ`>%����-���,o�=��s�Eˠ"P����z��    c��-)�p7�������-m)��R_P�ݧ6���r.�2�����b�Dԯ��Ρ�^2�L���x7.�R)dq��Ncc0"���n�%���%P� ��Y�k��!�d2X�V��Vĭ9k]�P����/g���nr0.�!��͕��v7W�o���ȥ�U$fƐ.,�kE5��JԭR:Rre�lPqZ�<��4&��NI�RE��m�z>���F�1t�F>}^��Ay%``"�&��~`��jWUۂO��؎����Tns����I	rU*��)7�.Ze��-��aW =30 hua��ʞ�:	��u��i��d�����[�͑��q2�2���ʂ��*��`C=��@�V)/���(OH
�%�yV����������c�-���/������s��sKF8]#��
�k�&�E;.��#,oѽ� �Z�w������+C��͆N�`ޣ5P��Օ��Q�׋w��C�]V�# #�ĪV��O��%%ew�?(e-� d ��n����0�� b,+�(mB�������W]�4���Y�k_�m�:���]����d tHqا�(���xĄ&I�y�Z�*�-y&�A:k�N&�gQ�Vcj���Chy08B9x10C(��X��*Fd��T�xMʧG?t�Iu�%��I&��C���K�}�<���^��Ͼ1@����ĀD��1���~|��\Yuȯ��V$X<���
��Aau׃�O7C�%��jF�O��Cܽ8�c��g�$,�-ގ5 ���xUH/���f!���!\`�mh���jWC�-����kϭ�����@�T������B���g�:Z�?6C�mܔ��"�A��iͱ�þ�7$��iM�V���D�Ge@�P[�a�[ضjeoN�E�C�S�iC�-l�Fw���M�tk�J�ᒑ+�Oa[en��2�!�Qh��v�� �oL�#c�Ԗ���\���;��]��n��HX-5�{u��%�/,�n��wH�y��m�sCz
nH���-ÅaM���
�^2�࠙u����*�J}��y�o@@��b�i�A"�
���&>G�O́�j�������Ki�1��<��O�o�tV'Z0�*fHջ4�`�\��}�1C��m�4�a�2��V��#W��)ޑ�Üd��8�@x����9 Q��`@�&�;nT;D�*-k+e�H��?���+���]���h��wO�"�v�bpP��3�a����#ލ~���R�bഽq��⋣L�����$)�j �tA���,!�'�:#8jF��gD1�b0�`���s�KP��F��6V�td0"v���t���n��KY>s5(�l\��d�U6�P�O��`������?��U�۷�zspZ޾�F'�Ym鷧
�fn72���Zkac���`DTo�ѳ���x`�<�,04Z��k1P��z�띤��!����Neg�� E�a囂�r�"���-�u����t|<�W,j��n.�q���|�B���T���A)��X-�Q�_��c�PǬ����M��h���(��ٸ�/��J%�o���D&9�4W��S7,
J�f�sf>k�X(� !���9	���-�B��z�o���g�\_Ģ�}��fzL�A��h�h��~[�N���&�>Ê��$�p7�FV�B��}�ӈE�]Ɂ��?�� D��v^�{u��~�<`�<�S��!�*��;V�[�\aQPǩ�~W����[��m<��H'��ě�V�i/,JxԛbUȵr�t�;�G�P��;+7R��v����s����;�h(璷C�A�RW��"+�P��[�DǪ���_�����r��N����
�]I��Gx�fAPι9V�B��vPx7Q�T긺����p~�OL��\~+�=��H�����O^Z�o�/���]������}��?\P�����t6f12�f-���smCz��H�H�M]�(��V��J�ߗ�X��\�,����1ӯf=�5Ixal@0���o��b1P��խL��S��U)��S�U���2H�9�r۟-[m���Az��'�YU��������i!�JiGxϾw0*����@(�R�w
�r���	�+�K�A,J�ٞ����v�,�5=���B�}`u��ܺ�\%���/��/=#� ��SgE`=�x�%7�b(�(�MԸҥ��P���=3�"�^�E!;�c�U�����Ff�3�E\7�����L����W��tƑ�� ʘ��\[|�VԴ(�d?K��k���+l�B�ʏ�۷�H�e���
�40$�t-�s+�'-O2�F )�Eq�24\�6�T�L�2��"��}cՑ�#R�5��o鎵�t���\�/�&s��8ʕ4�Ў�tf��8��u�\O΢��k[���P��}��⠌�� �]�%�,
�ֺUScc���,dA,j =s*����G�*�]t4�t��7#�h�t΢\C�Y��R����Z���"���
��e��X�P���ٸ�-��eJ������$�Xrf�+���	^E��
g�ʲ=W�V��ofZ�LF�[t/�W�C�!����?�*aZ��ծ�(��-co3�x�v?��!N):�b�q�i�������N�Pg֠D2ƥl�'0nS��JA-�����r�����Tnw�,\��(�&o������")w�،[Y�x�h��Z��g>:��2�вr[1��'��p��*���흀�A��]�=�R����q)lU�_e4`���/�_����	u2,�E�%RqN��+L՟�q�����Jx��"Qk[J�&�B����sf�)��;�B"�>N:�@���bw_U&T��Y�X��XM堂}��ne+���I�ͳZ��W|,j����~��H{ �*z�7 �~���f3/ܑ���X�f9�܇����~��D��K*���+~�@KM 1�g{��G�+2řW߃WL0�Fc�ˤ�t���q���
76���¤]I;6�n�9��Sb��j�:��BNqN9V��b�.�P��I�We���k[1�`%G��׻��F7*8���i2����b��Ko}vjl���{Q)(��+$�������"�4{���.��h��1:_����2.ձ�����q�E![�c�X�t��@�V��u�ի~k�����k�Pű�z�hؗԇy�QKڱ�lI-V�*�2��7 UR�:ctᢦA�W�|^QVZ�qau�#^�_h
f�B��M�(���JA�4_�G����&aV,�H-\o�PʹϊR8Iꙟ�A%��YY5^p�*�Ǫ�)��J����-A����T�c�x}�.�����=ݕ�k��`sTD�9/��V\ʦC�`�.��;���;a?Ḋ6Fe�~��<��@��r[K�2d�h�EB����9���07ݲµ���J)Ԙ�Y��"�&T*���3�2(@��J��>�p���Ui�ޭE@�=�s�8=�^N먂�� Y(ajA����)��8���^��ݶs���[��]����b�<���p"ǜfs�Գ���`V�p���J!��J��w?�<e�%�5����8����fN|jAB|�s����
kD�2+��-�!���Y����y��gL,J�՚��zL�RP���z׷�b�.B��gݸ�������M�#m��k�MW0w�*�d����}�J��8.&�2�3��02˰<YD9U�<�9_����O�O��N���S�ݯ���L؍�u�9[�Vte��5���e��@8d�4��Z�u�[m��Q
kT�ZR����~�|���`�ﻟKj����Q�za����o��}|p;��0h��WUX9/�� ���mp�C ���-��QJ�D�`�.���仏-V�}�?����e�Q����.E��:�ޔ�% ��{��Mv��uH�����!�c�̤E���p9E����0�5>���`I)wC��Ď�������B&+��
9�]��"�[++���X�`\U����^3PW�U�f��CX�-r��0��J� A   ���B�Ϊ�­��ǖ��%��⠐�k���M*"�b�M�>�@����~���� Rll      ;   x  x����N�@��3O�E�ԹB;+�"�07��`/P녷wZ�(M\H2�'��/�9�РH�D�:���ԋ�=iD|ٕ�Q!���3�@.ۻ������E3o���]�|�GT��?��'c�r7��C��;���p�+��]F��a�!\q�dp�d��*�����(�c��F����j���W.n<&բ^��>��`��ˈ.������O6����:�H�v�������v?�8q�P�)B�:���Tz�����3),�3}ˠ*��hD	��a�&��V�6k�$w��!�&����Ā\�@	��a�t�nPn��Z4pNx�ūNa�X W���qfru��������{�$&v��7����_��*a�	��a�� ���     